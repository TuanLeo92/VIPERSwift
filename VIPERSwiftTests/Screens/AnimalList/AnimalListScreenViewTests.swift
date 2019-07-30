//
//  AnimalListScreenViewTests.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

import XCTest

class AnimalListScreenViewTests: XCTestCase {

    var view: AnimalListScreenView!
    
    override func setUp() {
        view = AnimalListScreenView.loadFromStoryboard()
    }
    
    func test_loadNib() {
        view.loadView()
        XCTAssertNotNil(view.tableView)
    }
}
