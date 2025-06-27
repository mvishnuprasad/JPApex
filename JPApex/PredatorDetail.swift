//
//  PredatorDetail.swift
//  JPApex
//
//  Created by vishnuprasad on 26/06/25.
//

import SwiftUI
import MapKit
struct PredatorDetail: View {
    let predator: ApexPredator
   
    @State var position : MapCameraPosition
    var body: some View {
        GeometryReader(content: { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8),Gradient.Stop(color: .black, location: 1)], startPoint: .top, endPoint: .bottom)
                        }
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5 ,height: geo.size.height/3.7, alignment: .top)
                        .scaleEffect(x:-1)
                        .shadow(color: .black,radius:7)
                        .offset(y:40)
                    
                    
                }
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    NavigationLink {
                        PredatorMap(position: position)
                    }label: {
                        Map(position: $position){
                            Annotation(predator.name, coordinate: predator.location) {
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                        }
                        .frame(height: 140)
                        .clipShape(.rect(cornerRadius: 20))
                        .overlay(alignment:.trailing) {
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing,3)
                        }
                        .overlay(alignment:.topLeading) {
                            Text( "Current location")
                                .font(.subheadline)
    
                                .padding([.leading,.bottom],5)
                                .background(.black.opacity(0.33))
                                .padding(.trailing,3)
                                .clipShape(.rect(topLeadingRadius: 20,bottomTrailingRadius: 20))
                        }
                    }
                    Text("Appears in")
                        .font(.title3)
                    ForEach(predator.movies, id : \.self) {movie in
                        Text("• " + movie)
                            .font(.subheadline)
                    }
                    Text("Movie moments")
                        .font(.title)
                        .padding(.top,15)
                    ForEach(predator.movieScenes ) {scene in
                        Text(  scene.movie)
                            .font(.title2)
                            .padding(.vertical,1)
                        Text(  scene.sceneDescription)
                            .font(.title2)
                            .padding(.bottom,15)
                    }
                    Text("Read More")
                    
                    Link (predator.link, destination: URL(string: predator.link )!)
                        .padding(.bottom)
                }  .padding()
                    .frame(width: geo.size.width,alignment: .leading)
                
            } .ignoresSafeArea()
                .toolbarBackground(.automatic)
        })
        
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2], position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[0].location, distance: 2000)))
}
