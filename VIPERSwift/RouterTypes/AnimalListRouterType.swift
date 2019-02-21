//
//  AnimalListRouterType.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

protocol AnimalListRouterType: Router {

    func pushToAnimalDetail(with animal: Animal, from navigation: UINavigationController?)
    
}
