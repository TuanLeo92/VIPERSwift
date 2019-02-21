//
//  AnimalListInteractorMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//



@testable import VIPERSwift

class AnimalListInteractorMock: AnimalListInteractorType {
    
    var presenter: AnimalListPresenterType!
    var repository: AnimalListRepositoryType!
    
    var fetchAnimalListFromLocal_Called = false
    var fetchAnimalListFromLocal_ReturnValue: [Animal] = [Animal.mock()]
    
    func fetchAnimalListFromLocal() -> [Animal] {
        fetchAnimalListFromLocal_Called = true
        return fetchAnimalListFromLocal_ReturnValue
    }
}
