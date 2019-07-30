//
//  AnimalDetailsPresenter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

class AnimalDetailsPresenter: AnimalDetailsPresenterType {

    weak var view: AnimalDetailsViewType!
    var interactor: AnimalDetailsInteractorType!
    var router: AnimalDetailsRouterType!
    
    func viewDidLoad() {
        
    }
    
    func savePassedAnimal(_ animal: Animal) {
        interactor.savePassedAnimal(animal)
    }
    
    func fetchMoreInfoOfAnimal(animalId id: Int) {
        interactor.fetchMoreInfoOfAnimal(animalId: id)
    }
    
    func displayAnimalDetails(_ animal: Animal) {
        view.displayAnimalDetails(animal)
    }
    
    func backToPreviousScreen() {
        router.backToPreviousScreen()
    }
}
