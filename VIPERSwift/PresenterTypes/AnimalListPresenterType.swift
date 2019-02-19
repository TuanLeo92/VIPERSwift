//
//  AnimalListPresenterType.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

protocol AnimalListPresenterType: Presenter {
    
    var view: AnimalListViewType! { set get }
    var interactor: AnimalListInteractorType! { set get }
    var router: AnimalListRouterType! { set get }
    
    func viewDidLoad()
    func showAnimalDetail(with animal: Animal, from navigation: UINavigationController?)
    
}
