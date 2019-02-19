//
//  APIRequestComponents.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit
import Alamofire

struct APIEndPoint {
    
    private enum Host: String {
        case development = "http://host.dev"
        case production = "http://host.prod"
    }
    
    private static let version = "/api/v1"
    
    #if DEBUG
    static let endPoint = Host.development.rawValue + version
    #else
    static let endPoint = Host.production.rawValue + version
    #endif
    
}

struct APIRequest {
    //MARK: Url String
    struct URLString {
       
        struct Animal {
            static let animals = APIEndPoint.endPoint + "/animals"
            static let animal = APIEndPoint.endPoint + "/animals/{id}"
        }
    }
    
    //MARK: Method
    struct Method {

        struct Animal {
            static let animals = Alamofire.HTTPMethod.get
            static let animal = Alamofire.HTTPMethod.get
        }
    }
}
