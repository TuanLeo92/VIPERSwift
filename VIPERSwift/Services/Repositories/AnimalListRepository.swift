//
//  AnimalListRepository.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

protocol AnimalListRepositoryType {
    func fetchAnimalListFromLocal() -> [Animal]
}

final class AnimalListRepository: AnimalListRepositoryType {
    
    func fetchAnimalListFromLocal() -> [Animal] {
        return LocalService.shared.loadAnimalListFromPlist()
    }
}
