//
//  AnimalDetailInteractorType.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

protocol AnimalDetailInteractorType: Interactor {
    
    var presenter: AnimalDetailPresenterType! { set get }
    var repository: AnimalDetailRepositoryType! { set get }
    
}
