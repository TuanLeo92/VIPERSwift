//
//  AnimalDetailPresenterType.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import UIKit

protocol AnimalDetailPresenterType: Presenter {
    
    var view: AnimalDetailViewType! { set get }
    var interactor: AnimalDetailInteractorType! { set get }
    var router: AnimalDetailRouterType! { set get }
    
    func viewDidLoad()
    
}
