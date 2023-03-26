//
//  ContentView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 22/3/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: HeroesTableViewModel
    
    var body: some View {
        if let heroes = viewModel.heroes{
            
            VStack {
                AsyncImage(url: URL(string:"http://i.annihil.us/u/prod/marvel/i/mg/1/10/622795c13e687/portrait_uncanny.jpg" )){Image in
                    Image
                } placeholder: {
                    Image(systemName: "person")
                        .resizable()
                        .frame(height: 300)
                }
              
                Text(heroes[0].name)
                Text("Heroes Count: \(heroes.count)")
            }
            .padding()
        }
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Loading")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: HeroesTableViewModel(testing: true))
            
    }
}
