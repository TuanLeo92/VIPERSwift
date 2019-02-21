//
//  AnimalListRouterMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift
import UIKit

class AnimalListRouterMock: AnimalListRouterType {
    
    var pushToAnimalDetail_Called = false
    
    static func createAnimalListPresenter(_ referenceView: AnimalListView) {
        
    }
    
    func pushToAnimalDetail(with animal: Animal, from navigation: UINavigationController?) {
        pushToAnimalDetail_Called = true
    }
}
