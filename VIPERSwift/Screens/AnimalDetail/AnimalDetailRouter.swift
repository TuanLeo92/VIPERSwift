//
//  AnimalDetailRouter.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

class AnimalDetailRouter: AnimalDetailRouterType {
    
    static func createAnimalDetailPresenter(_ referenceView: AnimalDetailView) {
        
        let presenter = AnimalDetailPresenter()
        referenceView.presenter = presenter
        referenceView.presenter?.router = AnimalDetailRouter()
        referenceView.presenter?.view = referenceView
        referenceView.presenter?.interactor = AnimalDetailInteractor()
        referenceView.presenter?.interactor.presenter = presenter
        referenceView.presenter?.interactor.repository = AnimalDetailRepository()
    }
    
    func backToAnimalListScreen(from navigation: UINavigationController?) {
        navigation?.popViewController(animated: true)
    }
}
