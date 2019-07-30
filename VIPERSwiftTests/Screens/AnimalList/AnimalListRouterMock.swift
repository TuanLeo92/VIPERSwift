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
    
    var presenter: AnimalListPresenterType!
    weak var navigationController: UINavigationController?
    
    var goToAnimalDetailScreen_Called = false
    
    func goToAnimalDetailScreen(with animal: Animal) {
        goToAnimalDetailScreen_Called = true
    }
}
