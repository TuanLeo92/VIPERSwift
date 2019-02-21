//
//  AnimalDetailViewMock.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

class AnimalDetailViewMock: AnimalDetailViewType {

    var createAnimalDetailPresenter_Called = false
    var showAnimalDetail_Called = false
    
    func createAnimalDetailPresenter(_ referenceView: AnimalDetailView) {
        createAnimalDetailPresenter_Called = true
    }
    
    func showAnimalDetail() {
        showAnimalDetail_Called = true
    }
}
