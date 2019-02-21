//
//  AnimalListRouter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalListRouter: AnimalListRouterType {

    func pushToAnimalDetail(with animal: Animal, from navigation: UINavigationController?) {
        let animalDetailView = AnimalDetailView(nibName: "AnimalDetailView", bundle: nil)
        animalDetailView.animal = animal
        navigation?.pushViewController(animalDetailView, animated: true)
    }
}
