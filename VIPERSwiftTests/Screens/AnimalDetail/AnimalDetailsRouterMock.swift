//
//  AnimalDetailsRouterMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift
import UIKit

class AnimalDetailsRouterMock: AnimalDetailsRouterType {
    
    var presenter: AnimalDetailsPresenterType!
    weak var navigationController: UINavigationController?
    
    var backToPreviousScreen_Called = false
    
    func backToPreviousScreen() {
        backToPreviousScreen_Called = true
    }
}
