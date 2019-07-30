//
//  AnimalDetailRepository.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation
import RxSwift

protocol AnimalDetailsRepositoryType {
    
    func fetchAnimalDetails(animalId id: Int) -> Observable<Animal>
    
}

final class AnimalDetailsRepository: AnimalDetailsRepositoryType {
    
    func fetchAnimalDetails(animalId id: Int) -> Observable<Animal> {
        let input = GetAnimalDetailsInput(animalId: id)
        return APIService.shared.fetchAnimalDetails(input)
            .map({ output -> Animal in
                if let animal = output.animal {
                    return animal
                }
                throw APIResponseError.invalidResponseData
            })
    }
}
