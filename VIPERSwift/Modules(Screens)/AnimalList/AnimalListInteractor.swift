//
//  AnimalListInteractor.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation
import RxSwift

class AnimalListInteractor: AnimalListInteractorType {

    var presenter: AnimalListPresenterType!
    var repository: AnimalListRepositoryType!
    
    let bag = DisposeBag()
    var animals: [Animal] = []
    
    func fetchAnimalList() {
        repository.fetchAnimalList()
            .subscribe(onNext: { [weak self] animals in
                self?.saveAnimalList(animals)
                self?.presenter.displayAnimalList(animals)
            }, onError: { error in
                //Handle error
            })
            .disposed(by: bag)
    }
    
    func saveAnimalList(_ animals: [Animal]) {
        self.animals = animals
    }

}
