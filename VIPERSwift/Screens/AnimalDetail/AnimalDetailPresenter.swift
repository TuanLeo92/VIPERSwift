//
//  AnimalDetailPresenter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

class AnimalDetailPresenter: AnimalDetailPresenterType {
    
    weak var view: AnimalDetailViewType!
    
    var interactor: AnimalDetailInteractorType!
    var router: AnimalDetailRouterType!
    
    func viewDidLoad() {
        view.showAnimalDetail()
    }
}
