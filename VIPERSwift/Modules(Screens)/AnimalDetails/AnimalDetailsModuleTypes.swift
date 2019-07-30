//
//  AnimalDetailsModuleTypes.swift
//  VIPERSwift
//
//  Created by Le Tuan on 30/7/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

// MARK: - View
protocol AnimalDetailsViewType: View {
    
    func displayAnimalDetails(_ animal: Animal)
    
}

// MARK: - Interactor
protocol AnimalDetailsInteractorType: Interactor {
    
    var presenter: AnimalDetailsPresenterType! { set get }
    var repository: AnimalDetailsRepositoryType! { set get }
    
    func savePassedAnimal(_ animal: Animal)
    func fetchMoreInfoOfAnimal(animalId id: Int)
    func saveNewAnimal(_ animal: Animal)
}

// MARK: - Presenter
protocol AnimalDetailsPresenterType: Presenter {
    
    var view: AnimalDetailsViewType! { set get }
    var interactor: AnimalDetailsInteractorType! { set get }
    var router: AnimalDetailsRouterType! { set get }
    
    func viewDidLoad()
    func savePassedAnimal(_ animal: Animal)
    func fetchMoreInfoOfAnimal(animalId id: Int)
    func displayAnimalDetails(_ animal: Animal)
    
    func backToPreviousScreen()
}

// MARK: - Router
protocol AnimalDetailsRouterType: Router {
    
    var presenter: AnimalDetailsPresenterType! { set get }
    
    func backToPreviousScreen()
    
}
