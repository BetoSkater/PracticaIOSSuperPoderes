//
//  HeroesListView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import SwiftUI

struct HeroesListView: View {
    
    @StateObject var heroesViewModel: HeroesTableViewModel
    
    let testList = [Heroe(id: 54534, name: "prueba", description: "prueba", modified: "Date().self", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: []),]
    
    var body: some View {
    
        VStack {
//            TitleStyle{
//                Text("Marvel Heroes List")
//            }
            NavigationStack{
                List{
                    if let heroes = heroesViewModel.heroes{
                        ForEach(heroes){ heroe in
                            NavigationLink {
                                //TODO: to heroe series navigation
                                HeroeSeriesView(heroesSeriesViewModel: HeroeSeriesViewModel(heroe: heroe), heroe: heroe)
                            } label: {
                                HeroesRowCellView(heroe: heroe)
                                    
                            }

                        }
                    }
                }
//.padding(.top, -30)
              
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
