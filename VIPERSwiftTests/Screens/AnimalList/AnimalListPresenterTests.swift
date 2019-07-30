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
    
    func test_viewDidLoad() {
        presenter.viewDidLoad()
        XCTAssertTrue(interactor.fetchAnimalList_Called)
    }
    
    func test_displayAnimalList() {
        presenter.displayAnimalList([Animal()])
        XCTAssertTrue(view.displayAnimalList_Called)
    }
    
    func test_goToAnimalDetail() {
        presenter.goToAnimalDetail(with: Animal())
        XCTAssertTrue(router.goToAnimalDetailScreen_Called)
    }
}
