//
//  AnimalDetailsPresenterTests.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift
import XCTest

class AnimalDetailsPresenterTests: XCTestCase {

    var view: AnimalDetailsViewMock!
    var presenter: AnimalDetailsPresenter!
    var interactor: AnimalDetailsInteractorMock!
    var router: AnimalDetailsRouterMock!
    
    override func setUp() {
        super.setUp()
        
        view = AnimalDetailsViewMock()
        interactor = AnimalDetailsInteractorMock()
        router = AnimalDetailsRouterMock()
        
        presenter = AnimalDetailsPresenter()
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
    }
    
    func test_savePassedAnimal(_ animal: Animal) {
        interactor.savePassedAnimal(animal)
    }
    
    func test_fetchMoreInfoOfAnimal() {
        presenter.fetchMoreInfoOfAnimal(animalId: 1)
        XCTAssertTrue(interactor.fetchMoreInfoOfAnimal_Called)
    }
    
    func test_displayAnimalDetails() {
        presenter.displayAnimalDetails(Animal())
        XCTAssertTrue(view.displayAnimalDetails_Called)
    }
    
    func test_backToPreviousScreen() {
        presenter.backToPreviousScreen()
        XCTAssertTrue(router.backToPreviousScreen_Called)
    }
}
