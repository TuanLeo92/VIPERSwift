//
//  APIBase_Request.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol APIServiceType {
    
    func request<T: Mappable>(_ input: APIBaseInput) -> T
    func upload<T: Mappable>(_ input: APIBaseInput) -> T
    
}

class APIService: APIServiceType {
    
    static let shared = APIService()
    
    func request<T: Mappable>(_ input: APIBaseInput) -> T {
        return APIBaseOutput() as! T
    }
}
