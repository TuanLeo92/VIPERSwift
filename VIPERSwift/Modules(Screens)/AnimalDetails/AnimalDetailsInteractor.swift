//
//  AnimalDetailsInteractor.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation
import RxSwift

class AnimalDetailsInteractor: AnimalDetailsInteractorType {

    var presenter: AnimalDetailsPresenterType!
    var repository: AnimalDetailsRepositoryType!
    
    fileprivate let bag = DisposeBag()
    fileprivate var animal: Animal = Animal()
    
    func savePassedAnimal(_ animal: Animal) {
        self.animal = animal
    }
    
    func fetchMoreInfoOfAnimal(animalId id: Int) {
        repository.fetchAnimalDetails(animalId: id)
            .subscribe(onNext: { [weak self] animal in
                self?.saveNewAnimal(animal)
                self?.presenter.displayAnimalDetails(animal)
                }, onError: { [weak self] error in
                // If error then show info by passed animal
                if let animal = self?.animal {
                    self?.presenter.displayAnimalDetails(animal)
                }
            })
            .disposed(by: bag)
    }
    
    func saveNewAnimal(_ animal: Animal) {
        self.animal = animal
    }
}
