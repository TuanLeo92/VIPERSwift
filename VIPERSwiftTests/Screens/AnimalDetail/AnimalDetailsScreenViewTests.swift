//
//  AnimalDetailsScreenViewTests.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

import XCTest

class AnimalDetailsScreenViewTests: XCTestCase {

    var view: AnimalDetailsScreenView!
    
    override func setUp() {
        view = AnimalDetailsScreenView.loadFromStoryboard()
    }

    override func tearDown() {

    }

    func test_loadNib() {
        view.loadView()
        XCTAssertNotNil(view.bigImageView)
        XCTAssertNotNil(view.animalNameLabel)
        XCTAssertNotNil(view.animalDescriptionLabel)
    }
}
