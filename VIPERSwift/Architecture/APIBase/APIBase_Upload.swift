//
//  APIBase_Upload.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import ObjectMapper
import Alamofire

extension APIService {
    
    func upload<T: Mappable>(_ input: APIBaseInput) -> T {
        return APIBaseUploadOutput() as! T
    }
}
