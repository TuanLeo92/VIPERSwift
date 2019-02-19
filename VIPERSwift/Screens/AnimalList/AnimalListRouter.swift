//
//  AnimalListRouter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalListRouter: AnimalListRouterType {
    // Create
   static func createAnimalListPresenter(_ referenceView: AnimalListView) {
        
        let presenter = AnimalListPresenter()
        referenceView.presenter = presenter
        referenceView.presenter?.router = AnimalListRouter()
        referenceView.presenter?.view = referenceView
        referenceView.presenter?.interactor = AnimalListInteractor()
        referenceView.presenter?.interactor?.presenter = presenter
        referenceView.presenter?.interactor?.repository = AnimalListRepository()
    }
    
    // Navigator
    func pushToAnimalDetail(with animal: Animal, from navigation: UINavigationController?) {
        let animalDetailView = AnimalDetailView(nibName: "AnimalDetailView", bundle: nil)
        animalDetailView.animal = animal
        navigation?.pushViewController(animalDetailView, animated: true)
    }
}
