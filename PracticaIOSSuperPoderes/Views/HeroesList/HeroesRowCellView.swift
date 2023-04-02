//
//  HeroesRowCellView.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import SwiftUI

struct HeroesRowCellView: View {
    
    var heroe: Heroe
    
    var body: some View {
        HeroeCard(content: {
            ZStack{}
        }, heroe: heroe)
    }
}

struct HeroesRowCellView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowCellView(heroe: Heroe(id: 95865, name: "Ramonchu", description: "Ram", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg)) )
    }
}
