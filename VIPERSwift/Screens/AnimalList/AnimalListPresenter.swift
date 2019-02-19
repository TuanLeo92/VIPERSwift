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
        loadAnimals()
    }
    
    func loadAnimals() {
        let animals = interactor.fetchAnimalListFromLocal()
        view.showAnimalList(animals)
    }
    
    func showAnimalDetail(with animal: Animal, from navigation: UINavigationController?) {
        router.pushToAnimalDetail(with: animal, from: navigation)
    }
}
