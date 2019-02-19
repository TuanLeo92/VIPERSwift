//
//  Animal.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

class Animal {
    
    var id: Int
    var name: String
    var description: String?
    var image: String?
    var age: Int?
    var weight: Float?
    
    init() {
        self.id = 0
        self.name = ""
        self.description = nil
        self.image = ""
        self.age = nil
        self.weight = nil
    }
}

extension Animal {
    
    static func contertedAnimalFrom(_ diction: [String: Any]) -> Animal {
        
        let animal = Animal()
        animal.id = diction["id"] as? Int ?? 0
        animal.name = diction["name"] as? String ?? ""
        animal.description = diction["description"] as? String
        animal.image = diction["image"] as? String
        animal.age = diction["age"] as? Int
        animal.weight = diction["weight"] as? Float
        
        return animal
    }
}
