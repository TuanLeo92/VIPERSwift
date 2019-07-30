//
//  AnimalDetailsInteractorMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

class AnimalDetailsInteractorMock: AnimalDetailsInteractorType {

    var presenter: AnimalDetailsPresenterType!
    var repository: AnimalDetailsRepositoryType!

    var savePassedAnimal_Called = false
    var fetchMoreInfoOfAnimal_Called = false
    var saveNewAnimal_Called = false
    
    func savePassedAnimal(_ animal: Animal) {
        savePassedAnimal_Called = true
    }
    
    func fetchMoreInfoOfAnimal(animalId id: Int) {
        fetchMoreInfoOfAnimal_Called = true
    }
    
    func saveNewAnimal(_ animal: Animal) {
        saveNewAnimal_Called = true
    }
}
