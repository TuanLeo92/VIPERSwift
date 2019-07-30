//
//  AnimalListRepository.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import RxSwift

protocol AnimalListRepositoryType {
    
    func fetchAnimalList() -> Observable<[Animal]>
    
}

final class AnimalListRepository: AnimalListRepositoryType {
    
    func fetchAnimalList() -> Observable<[Animal]> {
        //Local
        let animals = LocalService.shared.loadAnimalListFromPlist()
        return Observable.just(animals)
        
        //Remote
        let input = GetAnimalListInput()
        return APIService.shared.fetchAnimals(input)
            .map({ output -> [Animal] in
                output.animals ?? []
            })
    }
}
