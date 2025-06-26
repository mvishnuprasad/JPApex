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
    
    struct MovieScene : Codable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
 
}
enum APType : String, Codable, CaseIterable, Identifiable{
    var id: APType {
        self
    }
    
    case land
    case air
    case sea
    case all
    
    var background : Color {
        switch self {
        case .all :
                .black
        case .land:
                .brown
        case .air:
                .teal
        case .sea:
                .blue
        }
    }
    
    var icon : String {
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .land:
            "leaf.fill"
        case .air:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}
