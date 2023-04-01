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
        
        
//        ZStack{
//            VStack {
//                AsyncImage(url: Tool.shared.ThumbnailToURLConverter(this: heroeSerie.thumbnail, withAspect: .portraitUncanny)) { Image in
//                    Image
//                        .resizable()
//                        .padding()
//                } placeholder: {
//                    Image(systemName: "photo.artframe")
//                }
//                Text(heroeSerie.description ?? "DescriptionNil")
//                    .frame(height: 100)
//                    .background(Color.white)
//                    .lineLimit(3)
//                    .padding()
//
//                SerieCard{
//
//                }
//
//                SerieCardTwo(content: {
//                    ZStack{}
//                }, serie: heroeSerie)
//
//
//
//            }
//            .opacity(0.6)
//
//            TitleStyle{
//                Text("\(heroeSerie.title)")
//
//            }
//
//
//
//
//
//        }
//        .frame(height: 600)
//        .background(.gray) //TODO: Change to gray
//        .cornerRadius(25)
    }
}

struct HeroeSeriesRowCellView_Previews: PreviewProvider {
    static var previews: some View {
        HeroeSeriesRowCellView(heroeSerie:
                                Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        )
//        HeroeSeriesRowCellView(heroeSerie:
//                                Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", resourceURI: "http://gateway.marvel.com/v1/public/series/14569", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/series/14569/captain_america_and_the_first_thirteen_2011?utm_campaign=apiRef&utm_source=70c3542b3477f3734ce1952ea11618d0")], startYear: 2011, endYear: 2011, rating: "T+", type: "one shot", modified: "2019-09-20T20:11:50-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg), creators: Creators(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/creators", items: [], returned: 3), characters: Characters(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), stories: Stories(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), comics: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), events: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), next: nil, previous: nil)
//            )
    }
}
