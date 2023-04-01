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
//        ZStack {
//            Rectangle()
//                .fill(Color(.lightGray))
//                .frame(height: 350)
//
//            VStack{
//                AsyncImage(url: Tool.shared.ThumbnailToURLConverter(this: heroe.thumbnail, withAspect: .portraitUncanny)) {Image in
//                    Image
//                        .resizable()
//                        .frame(width:300 ,height: 250)
//                        .aspectRatio(contentMode: .fill)
//                        .cornerRadius(20)
//                        .padding()
//
//                } placeholder: {
//                    Image(systemName: "person")
//                }
//
//                TitleStyle{
//                    Text(heroe.name)
//                        .padding(.top, -20)
//                }
//            }
//            .frame(height: 325)
//            .cornerRadius(30)
//            .padding()
//        }
//        .cornerRadius(30)
//        .padding()
//
    }
}

struct HeroesRowCellView_Previews: PreviewProvider {
    static var previews: some View {
        HeroesRowCellView(heroe: Heroe(id: 95865, name: "Spiderman", description: "El hombre araña.", modified: "2022-05-03T11:41:04-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg), resourceURI: "http://gateway.marvel.com/v1/public/characters/1017857", comics: Comics(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/55840", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #1"),ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/77241", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #2")], returned: 2), series: Comics(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/55840", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #1 SERIES"),ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/77241", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #2 SERIES")], returned: 2), stories: Stories(available: 1, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/stories", items: [StoriesItem(resourceURI: "http://gateway.marvel.com/v1/public/stories/89913", name: "Captain America and the First Thirteen (2011) #1", type: .cover)], returned: 1), events: Comics(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/characters/1017857/comics", items: [ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/55840", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #1 EVENTS"),ComicsItem(resourceURI: "http://gateway.marvel.com/v1/public/comics/77241", name: "Agent Carter: S.H.I.E.L.D. 50th Anniversary (2015) #2 EVENTS")], returned: 2), urls: [URLElement(type: .detail, url: "http://marvel.com/characters/3503/peggy_carter?utm_campaign=apiRef&utm_source=70c3542b3477f3734ce1952ea11618d0")]))
    }
}
