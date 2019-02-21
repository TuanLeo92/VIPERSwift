//
//  Animal.swift
//  VIPERSwift
//
//  Created by Le Tuan on 15/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

final class Animal {
    
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
    
    convenience init(id: Int, name: String, description: String?,
                     image: String?, age: Int?, weight: Float?) {
        self.init()
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.age = age
        self.weight = weight
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
