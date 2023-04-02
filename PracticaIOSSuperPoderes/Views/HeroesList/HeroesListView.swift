//
//  HeroesListView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import SwiftUI

struct HeroesListView: View {
    
    @StateObject var heroesViewModel: HeroesTableViewModel
        
    var body: some View {
        
        VStack {
            NavigationStack{
                List{
                    if let heroes = heroesViewModel.heroes{
                        ForEach(heroes){ heroe in
                            NavigationLink {
                                HeroeSeriesView(heroesSeriesViewModel: HeroeSeriesViewModel(heroe: heroe), heroe: heroe)
                            } label: {
                                HeroesRowCellView(heroe: heroe)
                            }
                        }
                    }
                }
                .padding(.leading, -10)
            }//TODO: solve the problem with the title, I think that It can't be done this way
            .navigationTitle("Marvel Heroes List")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HeroesListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesListView(heroesViewModel: HeroesTableViewModel(testing: true))
    }
}
