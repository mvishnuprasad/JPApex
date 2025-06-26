//
//  PredatorDetail.swift
//  JPApex
//
//  Created by qbuser on 26/06/25.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader(content: { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5 ,height: geo.size.height/3.7, alignment: .top)
                        .scaleEffect(x:-1)
                        .shadow(color: .black,radius:7)
                        .offset(y:40)
                    
                    
                }
                .border(FillShapeStyle.fill, width: 5)
                VStack(alignment: .leading) {
                    Text(predator.name)
                        .font(.largeTitle)
                    
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
        })
        
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
}
