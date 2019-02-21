//
//  AnimalListViewType.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

protocol AnimalListViewType: class {
    
    func createAnimalListPresenter(_ referenceView: AnimalListView)
    
    func showAnimalList(_ animals: [Animal])
    
}
