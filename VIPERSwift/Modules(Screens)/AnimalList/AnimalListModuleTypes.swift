//
//  AnimalListModuleTypes.swift
//  VIPERSwift
//
//  Created by Le Tuan on 30/7/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

// MARK: - View
protocol AnimalListViewType: View {
    
    func displayAnimalList(_ animals: [Animal])
    
}


// MARK: - Interactor
protocol AnimalListInteractorType: Interactor {
    
    var presenter: AnimalListPresenterType! { set get }
    var repository: AnimalListRepositoryType! { set get }
    
    func fetchAnimalList()
    func saveAnimalList(_ animals: [Animal])
    
}

// MARK: - Presenter
protocol AnimalListPresenterType: Presenter {
    
    var view: AnimalListViewType! { set get }
    var interactor: AnimalListInteractorType! { set get }
    var router: AnimalListRouterType! { set get }
    
    func viewDidLoad()
    func displayAnimalList(_ animals: [Animal])
    
    func goToAnimalDetail(with animal: Animal)
}

// MARK: - Router
protocol AnimalListRouterType: Router {
    
    var presenter: AnimalListPresenterType! { set get }
    
    func goToAnimalDetailScreen(with animal: Animal)
    
}
