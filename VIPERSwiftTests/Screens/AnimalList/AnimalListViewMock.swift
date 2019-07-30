//
//  AnimalListViewMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

class AnimalListViewMock: AnimalListViewType {
    
    var createPresenter_Called = false
    var displayAnimalList_Called = false
    
    func createPresenter() {
        createPresenter_Called = true
    }
    
    func displayAnimalList(_ animals: [Animal]) {
        displayAnimalList_Called = true
    }
}
