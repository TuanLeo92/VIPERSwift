//
//  AnimalMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

extension Animal: MockAble {
    
    static func mock() -> Animal {
        return Animal(id: 1, name: "Leo", description: "",
                          image: "mouse.jpg", age: nil, weight:nil)
    }
}

