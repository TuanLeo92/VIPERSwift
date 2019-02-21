//
//  AnimalListPresenterTests.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

import XCTest

class AnimalListPresenterTests: XCTestCase {

    var view: AnimalListViewMock!
    
    var presenter: AnimalListPresenter!
    var interactor: AnimalListInteractorMock!
    var router: AnimalListRouterMock!
    
    override func setUp() {
        super.setUp()
        
        view = AnimalListViewMock()
        interactor = AnimalListInteractorMock()
        router = AnimalListRouterMock()
        
        
        presenter = AnimalListPresenter()
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
    }
    
    func test_loadAnimals() {
        presenter.loadAnimals()
        XCTAssertTrue(interactor.fetchAnimalListFromLocal_Called)
        XCTAssertTrue(view.showAnimalList_Called)
    }
    
    func test_showAnimalDetail() {
        presenter.showAnimalDetail(with: Animal.mock(), from: nil)
        XCTAssertTrue(router.pushToAnimalDetail_Called)
    }
}
