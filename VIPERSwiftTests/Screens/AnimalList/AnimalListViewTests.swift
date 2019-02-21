//
//  AnimalListViewTests.swift
//  VIPERSwiftTests
//
//  Created by Le Tuan on 21/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

@testable import VIPERSwift

import XCTest

class AnimalListViewTests: XCTestCase {

    var view: AnimalListView!
    
    override func setUp() {
        view = AnimalListView(nibName: AnimalListView.className, bundle: nil)
    }
    
    func test_loadNib() {
        view.loadView()
        XCTAssertNotNil(view.tableView)
    }
}
