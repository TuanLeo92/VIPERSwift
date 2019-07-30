//
//  AnimalListPresenter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalListPresenter: AnimalListPresenterType {

    // Declare 'view' variable is weak type to avoid retain cycle
    weak var view: AnimalListViewType!
    
    var interactor: AnimalListInteractorType!
    var router: AnimalListRouterType!
    var presenter: AnimalListPresenterType!
    
    func viewDidLoad() {
        interactor.fetchAnimalList()
    }

    func displayAnimalList(_ animals: [Animal]) {
        view.displayAnimalList(animals)
    }
    
    func goToAnimalDetail(with animal: Animal) {
        router.goToAnimalDetailScreen(with: animal)
    }
}
