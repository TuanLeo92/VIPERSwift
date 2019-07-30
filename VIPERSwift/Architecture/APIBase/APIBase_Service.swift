//
//  APIBase_Request.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Alamofire
import ObjectMapper
import RxSwift
import RxAlamofire

protocol APIServiceType {
    
    func request<T: Mappable>(_ input: APIBaseInput) -> Observable<T>
    func upload<T: Mappable>(_ input: APIBaseUploadInput) -> Observable<T>
    
}

typealias JSONDictionary = [String: Any]

final class APIService: APIServiceType {
    
    static let shared = APIService()
    
    func request<T: Mappable>(_ input: APIBaseInput) -> Observable<T> {
        
        return request(input)
            .map { json -> T in
                if let t = T(JSON: json) {
                    return t
                }
                throw APIResponseError.invalidResponseData
        }
    }
    
    func upload<T: Mappable>(_ input: APIBaseUploadInput) -> Observable<T> {
        
        return upload(input, data: input.uploadData)
            .map { json -> T in
                if let t = T(JSON: json) {
                    return t
                }
                throw APIResponseError.invalidResponseData
        }
    }
    
}

// MARK: - Implemement methods
extension APIService {
    fileprivate func request(_ input: APIBaseInput) -> Observable<JSONDictionary> {
        let urlRequest = preprocessInput(input)
            .do(onNext: { input in
                print(input)
            })
            .flatMapLatest { input in
                Alamofire.SessionManager.default.rx
                    .request(input.method,
                             input.urlString,
                             parameters: input.parameters,
                             encoding: input.encoding,
                             headers: input.headers)
            }
            .do(onNext: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                }
            })
            .flatMapLatest { dataRequest -> Observable<(HTTPURLResponse, Data)> in
                return dataRequest
                    .rx.responseData()
            }
            .do(onNext: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }, onError: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            })
            .map { (dataResponse) -> JSONDictionary in
                return try self.process(dataResponse)
            }
            .catchError({ [weak self] (error) -> Observable<[String : Any]> in
                guard let this = self else { return Observable.empty() }
                if case APIResponseError.expiredToken = error {
                    return this.request(input)
                }
                throw error
            })
        
        return urlRequest
    }
    
    fileprivate func upload(_ input: APIBaseUploadInput,
                            data: [APIBaseUploadData]) -> Observable<JSONDictionary> {
        return preprocessUploadInput(input)
            .do(onNext: { input in
                print(input)
            })
            .flatMapLatest { input -> Observable<DataRequest> in
                return Observable.create({ observer in
                    _ = Alamofire.SessionManager.default.upload(multipartFormData: { multipartFormData in
                        if let params = input.parameters {
                            for (key, value) in params {
                                if let data = String(describing: value).data(using:.utf8) {
                                    multipartFormData.append(data, withName: key)
                                }
                            }
                        }
                        data.forEach({
                            if let uploadData = $0.data {
                                multipartFormData.append(uploadData,
                                                         withName: $0.name,
                                                         fileName: $0.fileName,
                                                         mimeType: $0.mimeType)
                            }
                        })
                    }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold,
                       to: input.urlString,
                       method: input.method,
                       headers: input.headers,
                       queue: nil, encodingCompletion: { result in
                        switch result {
                        case .failure(let error):
                            observer.on(.error(error))
                        case .success(let request, _, _):
                            observer.on(.next(request))
                        }
                    })
                    return Disposables.create()
                })
            }
            .do(onNext: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = true
                }
            })
            .flatMapLatest { dataRequest -> Observable<(HTTPURLResponse, Data)> in
                return dataRequest
                    .rx.responseData()
            }
            .do(onNext: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            }, onError: { (_) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            })
            .map { (dataResponse) -> JSONDictionary in
                return try self.process(dataResponse)
            }
            .catchError({ [weak self] (error) -> Observable<[String : Any]> in
                guard let this = self else { return Observable.empty() }
                if case APIResponseError.expiredToken = error {
                    return this.upload(input, data: data)
                }
                throw error
            })
    }
    
    fileprivate func process(_ response: (HTTPURLResponse, Data)) throws -> JSONDictionary {
        let (response, data) = response
        let json: JSONDictionary? = (try? JSONSerialization.jsonObject(with: data, options: [])) as? JSONDictionary
        let error: Error
        switch response.statusCode {
        case 200..<300:
            print("👍 [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
            return json ?? JSONDictionary()
        case 401:
            error = APIResponseError.expiredToken
        default:
            if let json = json, let responseError = ResponseError(JSON: json) {
                error = APIResponseError.error(response: responseError)
            } else {
                error = APIResponseError.unknown(statusCode: response.statusCode)
            }
            print("❌ [\(response.statusCode)] " + (response.url?.absoluteString ?? ""))
            if let json = json {
                print(json)
            }
        }
        throw error
    }
    
    fileprivate func preprocessInput(_ input: APIBaseInput) -> Observable<APIBaseInput> {
        return Observable.deferred {
            if input.isTokenRequired,
                let token = AppSessionManager.shared.getAccessToken() {
                var headers = input.headers
                headers["Authorization"] = "Bearer \(token)"
                input.headers = headers
                input.accessToken = token
            }
            
            return Observable.just(input)
        }
    }
    
    fileprivate func preprocessUploadInput(_ input: APIBaseUploadInput) -> Observable<APIBaseUploadInput> {
        if input.isTokenRequired,
            let token = AppSessionManager.shared.getAccessToken() {
            var headers = input.headers
            headers["Authorization"] = "Bearer \(token)"
            input.headers = headers
            input.accessToken = token
        }
        
        return Observable.just(input)
    }
}
