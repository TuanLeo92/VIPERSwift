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
    
    var fetchAnimalList_Called = false
    var saveAnimalList_Called = false

    func fetchAnimalList() {
        fetchAnimalList_Called = true
    }
    
    func saveAnimalList(_ animals: [Animal]) {
        saveAnimalList_Called = true
    }
}
