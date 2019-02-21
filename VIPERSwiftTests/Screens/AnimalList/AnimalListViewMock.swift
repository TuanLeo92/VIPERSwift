//
//  AnimalListViewMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

class AnimalListViewMock: AnimalListViewType {
    
    var createAnimalListPresenter_Called = false
    var showAnimalList_Called = false
    
    func createAnimalListPresenter(_ referenceView: AnimalListView) {
        createAnimalListPresenter_Called = true
    }
    
    func showAnimalList(_ animals: [Animal]) {
        showAnimalList_Called = true
    }
}
