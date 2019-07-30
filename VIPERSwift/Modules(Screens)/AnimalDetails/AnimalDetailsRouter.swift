//
//  AnimalDetailsRouter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalDetailsRouter: AnimalDetailsRouterType {
    
    var presenter: AnimalDetailsPresenterType!
    weak var navigationController: UINavigationController?
    
    func backToPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }
}
