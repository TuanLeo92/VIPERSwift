//
//  API+Animal.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import ObjectMapper

extension APIService {
    func getAnimals(_ input: GetAnimalListInput) -> GetAnimalListOutput {
        return request(input)
    }
}

//MARK: - Get animals
class GetAnimalListInput: APIBaseInput {
    
    init() {
        super.init(urlString: APIRequest.URLString.Animal.animals, method: .get, parameters: nil)
    }
}

class GetAnimalListOutput: APIBaseOutput {
    
    var animal: [Animal]?
    
    override func mapping(map: Map) {
        
    }
}
