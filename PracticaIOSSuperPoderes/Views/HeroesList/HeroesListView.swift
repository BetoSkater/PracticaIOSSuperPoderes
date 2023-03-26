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
        
        
        
        NavigationStack{
            List{
                if let heroes = heroesViewModel.heroes{
                    ForEach(heroes){ heroe in
                        NavigationLink {
                            //TODO: to heroe series navigation
                        } label: {
                            HeroesRowCellView(heroe: heroe)
                        }

                    }
                }
               
                
            }
        }
    }
}

struct HeroesListView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesListView(heroesViewModel: HeroesTableViewModel(testing: true))
    }
}
