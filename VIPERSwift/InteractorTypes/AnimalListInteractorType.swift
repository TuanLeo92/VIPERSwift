//
//  AnimalListInteractorType.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

protocol AnimalListInteractorType: Interactor {
    
    var presenter: AnimalListPresenterType! { set get }
    var repository: AnimalListRepositoryType! { set get }
    
    func fetchAnimalListFromLocal() -> [Animal]
    
}
