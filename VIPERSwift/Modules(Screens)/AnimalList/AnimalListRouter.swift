//
//  AnimalListRouter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalListRouter: AnimalListRouterType {
    
    var presenter: AnimalListPresenterType!
    weak var navigationController: UINavigationController? //Declare weak type to avoid retain cycle
    

    func goToAnimalDetailScreen(with animal: Animal) {
        let animalDetailView = AnimalDetailsScreenView.loadFromStoryboard()
        animalDetailView.animal = animal
        navigationController?.pushViewController(animalDetailView, animated: true)
    }
}
