//
//  File.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

enum APIResponseError: Error {
    case invalidResponseData
    case expiredToken
    case error(response: APIBaseOutput)
    case unknown(statusCode: Int)
    //...
}

final class ResponseError: APIBaseOutput {
    
}
