//
//  HeroeSeriesRowCellView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 27/3/23.
//

import SwiftUI

struct HeroeSeriesRowCellView: View {
    
    var heroeSerie: Serie
    
    var body: some View {
        SerieCard(content: {
            ZStack{}
        }, serie: heroeSerie)
    }
}

struct HeroeSeriesRowCellView_Previews: PreviewProvider {
    static var previews: some View {
        HeroeSeriesRowCellView(heroeSerie:
                                Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg)))
    }
}
