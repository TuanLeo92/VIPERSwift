//
//  AnimalDetailRouterType.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

protocol AnimalDetailRouterType: Router {
    
    static func createAnimalDetailPresenter(_ referenceView: AnimalDetailView)
    
    func backToAnimalListScreen(from navigation: UINavigationController?)
    
}
