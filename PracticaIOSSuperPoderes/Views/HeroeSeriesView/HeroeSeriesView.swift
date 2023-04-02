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
                            .id(2)
                    }
                }
            }
            .id(1)
        }
        .navigationTitle("Series List")
        .navigationBarTitleDisplayMode(.inline)
        .id(0)
    }
}

struct HeroeSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        
        HeroeSeriesView(heroesSeriesViewModel: HeroeSeriesViewModel(heroe: Heroe(id: 95865, name: "Ramonchu", description: "Ram", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg))))
            .environmentObject(HeroesTableViewModel(testing: true))
    }
}
