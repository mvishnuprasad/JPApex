//
//  ContentView.swift
//  JPApex
//
//  Created by vishnuprasad on 26/06/25.
//

import SwiftUI

struct ContentView: View {
    let predators = Predators()
    @State var searchText = ""
    var filterdList : [ApexPredator] {
        return searchText == "" ? predators.apexPredators : predators.apexPredators.filter({ apexPredator in
            apexPredator.name.localizedCaseInsensitiveContains(searchText)
        })
    }
    var body: some View {
        NavigationStack {
            List(filterdList){ predator in
                NavigationLink{
                    
                } label : {
                    HStack{
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100,height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading){
                            Text(predator.name)
                                .fontWeight(.bold)
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            
        } .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
