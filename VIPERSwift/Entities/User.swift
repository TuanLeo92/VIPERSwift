//
//  User.swift
//  VIPERSwift
//
//  Created by Le Tuan on 30/7/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation
import ObjectMapper

struct User {
    
    var id: String
    
}

extension User {
    init() {
        id = ""
    }
}

extension User: Mappable {
    
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        
    }
}
