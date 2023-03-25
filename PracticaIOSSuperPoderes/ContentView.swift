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
                Image(systemName: "person")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
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
