//
//  AnimalDetailRouter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalDetailRouter: AnimalDetailRouterType {
    
    func backToAnimalListScreen(from navigation: UINavigationController?) {
        navigation?.popViewController(animated: true)
    }
}
