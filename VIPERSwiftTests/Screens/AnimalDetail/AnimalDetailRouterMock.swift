//
//  AnimalDetailRouterMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift
import UIKit

class AnimalDetailRouterMock: AnimalDetailRouterType {
    
    var backToAnimalListScreen_Called = false
    
    func backToAnimalListScreen(from navigation: UINavigationController?) {
        backToAnimalListScreen_Called = true
    }
}
