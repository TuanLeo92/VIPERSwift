//
//  AnimalDetailsViewMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

class AnimalDetailsViewMock: AnimalDetailsViewType {
    
    var createPresenter_Called = false
    var displayAnimalDetails_Called = false

    func createPresenter() {
        createPresenter_Called = true
    }
    
    func displayAnimalDetails(_ animal: Animal) {
        displayAnimalDetails_Called = true
    }
}
