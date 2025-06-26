//
//  ApexPredator.swift
//  JPApex
//
//  Created by vishnuprasad on 26/06/25.
//

import Foundation
struct ApexPredator : Codable{
    let id : Int
    let name : String
    let type : String
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let movieScenes :[MovieScene]
    let link : String
    
    struct MovieScene : Codable {
        let id: String
        let movie: String
        let sceneDescription: String
    }
}
