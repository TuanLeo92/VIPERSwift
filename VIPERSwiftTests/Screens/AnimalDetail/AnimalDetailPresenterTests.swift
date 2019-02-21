//
//  AnimalDetailPresenterTests.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift
import XCTest

class AnimalDetailPresenterTests: XCTestCase {

    var view: AnimalDetailViewMock!
    var presenter: AnimalDetailPresenter!
    var interactor: AnimalDetailInteractorMock!
    var router: AnimalDetailRouterMock!
    
    override func setUp() {
        super.setUp()
        
        view = AnimalDetailViewMock()
        interactor = AnimalDetailInteractorMock()
        router = AnimalDetailRouterMock()
        
        presenter = AnimalDetailPresenter()
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
    }
    
    func test_showAnimalDetail() {
        presenter.viewDidLoad()
        XCTAssertTrue(view.showAnimalDetail_Called)
    }
}
