//
//  API+Animal.swift
//  VIPERSwift
//
//  Created by Le Tuan on 18/2/19.
//  Copyright © 2019 Le Tuan. All rights reserved.
//

import ObjectMapper
import RxSwift

extension APIService {
    func fetchAnimals(_ input: GetAnimalListInput) -> Observable<GetAnimalListOutput> {
        return request(input)
    }
    
    func fetchAnimalDetails(_ input: GetAnimalDetailsInput) -> Observable<GetAnimalDetailsOutput> {
        return request(input)
    }
}

// MARK: - Get Animal List I/O
class GetAnimalListInput: APIBaseInput {
    
    init() {
        super.init(urlString: APIRequest.URLString.animals,
                   method: APIRequest.Method.animals,
                   parameters: nil)
    }
}

class GetAnimalListOutput: APIBaseOutput {
    
    var animals: [Animal]?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        animals <- map["data"]
    }
}

// MARK: - Get Animal Details I/O
class GetAnimalDetailsInput: APIBaseInput {
    
    init(animalId: Int) {
        super.init(urlString: String(format: APIRequest.URLString.animal, animalId),
                   method: APIRequest.Method.animal,
                   parameters: nil)
    }
}

class GetAnimalDetailsOutput: APIBaseOutput {
    
    var animal: Animal?
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        animal <- map["data"]
    }
}
