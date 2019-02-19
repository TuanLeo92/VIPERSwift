//
//  Local+Animal.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import Foundation

//Example

class LocalService {
    
    static let shared = LocalService()
    
    func loadAnimalListFromPlist() -> [Animal] {
        
        guard let animalsPath = Bundle.main.path(forResource: "Animals", ofType: "plist"),
            let animalsPlist = NSArray(contentsOfFile: animalsPath) else {
            return []
        }
        
        var animals: [Animal] = []
        for animalPlist in animalsPlist {
            if let animalPlist = animalPlist as? [String : Any] {
                let animal = Animal.contertedAnimalFrom(animalPlist)
                animals.append(animal)
            }
        }
        
        return animals
    }
    
}
