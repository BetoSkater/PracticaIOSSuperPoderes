//
//  HeroeSeriesView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 27/3/23.
//

import SwiftUI

struct HeroeSeriesView: View {
   
    @EnvironmentObject var baseViewModel: HeroesTableViewModel
    
    @StateObject var heroesSeriesViewModel: HeroeSeriesViewModel 
    
    var heroe: Heroe? //TODO:
    
    var body: some View {
        NavigationStack{
            List{
                if let heroeSeries =  heroesSeriesViewModel.series {
                    ForEach(heroeSeries) { series in
                        HeroeSeriesRowCellView(heroeSerie: series)
//                        NavigationLink {
//                            //To series detail view
//                        } label: {
//                            HeroeSeriesRowCellView(heroeSerie: series)
//                        }

                    }
                }
                
               
            }
        }
        .navigationTitle("Series List")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HeroeSeriesView_Previews: PreviewProvider {
    static var previews: some View {
       
        HeroeSeriesView(heroesSeriesViewModel: HeroeSeriesViewModel(heroe: Heroe(id: 95865, name: "Ramonchu", description: "Ram", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg))))
       // HeroeSeriesView(heroesSeriesViewModel: HeroeSeriesViewModel(heroe: Heroe(id: 54534, name: "prueba", description: "prueba", modified: "Date().self", thumbnail: Thumbnail(path: "thubpath", thumbnailExtension: .jpg), resourceURI: "prueba", comics: Comics(available: -5, collectionURI: "prueba", items: [], returned: -1), series: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), stories: Stories(available: -1, collectionURI: "prueba", items: [], returned: -1), events: Comics(available: -1, collectionURI: "Prueba", items: [], returned: -1), urls: []), testing: true))
            .environmentObject(HeroesTableViewModel(testing: true))
    }
}
