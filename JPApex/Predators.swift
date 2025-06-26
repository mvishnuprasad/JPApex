//
//  Predators.swift
//  JPApex
//
//  Created by vishnuprasad on 26/06/25.
//

import Foundation
class Predators {
    var apexPredators : [ApexPredator]=[]
    init() {
        decodeApex()
    }
    func decodeApex (){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let apexPredators = try decoder.decode([ApexPredator].self, from: data)
            }catch{
                print("Error occured while decoding")
            }
        }
    }
}
