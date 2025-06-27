//
//  PredatorMap.swift
//  JPApex
//
//  Created by qbuser on 26/06/25.
//

import SwiftUI
import MapKit
struct PredatorMap: View {
    let predator = Predators()
    @State var position : MapCameraPosition
    @State var style : Bool = false
    var body: some View {
        Map(position: $position){
            ForEach(predator.apexPredators){ predator in
                Annotation(predator.name, coordinate: predator.location) {
                   Image( predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .scaleEffect(x:-1)
                    
                }
            }
        }
        .mapStyle(.imagery(elevation: .realistic))
        .overlay (alignment : .bottomTrailing){
            Button{
                style.toggle()
            }label: {
                Image(systemName: style ? "globe.americas.fill" : "globe.americas" )
                    .font(.largeTitle)
                    .padding()
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000,heading: 250,pitch: 80)))
}
