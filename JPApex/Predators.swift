//
//  Predators.swift
//  JPApex
//
//  Created by vishnuprasad on 26/06/25.
//

import Foundation

class Predators {
    var apexPredators : [ApexPredator]=[]
    var allApexPredators : [ApexPredator]=[]
    init() {
        decodeApex()
    }
    func decodeApex (){
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json"){
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            }catch{
                print("Error occured while decoding\(error)")
            }
        }
    }
    func search(for searchTerm : String)-> [ApexPredator]{
        return searchTerm == "" ? self.apexPredators : self.apexPredators.filter({ apexPredator in
            apexPredator.name.localizedCaseInsensitiveContains(searchTerm)
        })
    }
    func sort (by alphabetical: Bool){
        apexPredators.sort { one, two in
            if alphabetical {
                one.name<two.name
            }else{
                one.id<two.id
            }
        }
    }
    func filterByType(by type : APType)  {
        if type == .all {
            apexPredators = allApexPredators
        }else{
            self.apexPredators =  self.allApexPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
