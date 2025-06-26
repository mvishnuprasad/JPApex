//
//  ApexPredator.swift
//  JPApex
//
//  Created by vishnuprasad on 26/06/25.
//

import Foundation
import SwiftUI
struct ApexPredator : Codable, Identifiable{
    let id : Int
    let name : String
    let type : APType
    let latitude : Double
    let longitude : Double
    let movies : [String]
    let movieScenes :[MovieScene]
    let link : String
    var image : String {
        return name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene : Codable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    enum APType : String, Codable{
        case land
        case air
        case sea
        
        var background : Color {
            switch self {
            case .land:
                    .brown
            case .air:
                    .teal
            case .sea:
                    .blue
            }
        }
    }
}
