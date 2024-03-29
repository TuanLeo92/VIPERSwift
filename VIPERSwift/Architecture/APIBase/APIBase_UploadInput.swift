//
//  APIBase_UploadInput.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation
import Alamofire

class APIBaseUploadInput {
    
    let urlString: String
    let method: HTTPMethod
    let parameters: [String: Any]?
    var encoding: ParameterEncoding
    let isTokenRequired: Bool
    let uploadData: [APIBaseUploadData]
    var headers: [String: String] = [:]
    var accessToken: String = ""
    
    init(urlString: String, method: HTTPMethod, parameters: [String: Any]?, isTokenRequired: Bool = true, uploadData: [APIBaseUploadData]) {
        self.urlString = urlString
        self.method = method
        self.parameters = parameters
        self.encoding = method == .get ? URLEncoding.default : JSONEncoding.default
        self.isTokenRequired = isTokenRequired
        self.uploadData = uploadData
    }
}
