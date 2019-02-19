//
//  AnimalListInteractor.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

class AnimalListInteractor: AnimalListInteractorType {
    
    var presenter: AnimalListPresenterType!
    var repository: AnimalListRepositoryType!
    
    func fetchAnimalListFromLocal() -> [Animal] {
        return repository.fetchAnimalListFromLocal()
    }
}
