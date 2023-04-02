//
//  HeroeDetailViewModel.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//


import Foundation
import Combine


final class HeroeSeriesViewModel: ObservableObject{
    @Published var status: Status = .none
    @Published var series: [Serie] = []
    
    @Published var heroe: Heroe
    
    var suscriptor = Set<AnyCancellable>()
    
    init(heroe: Heroe,testing: Bool = false){
        self.heroe = heroe
        if !testing{
            self.getApiSeries()
        }else{
            self.getTestSeries()
        }
       
    }
    
    func getApiSeries(){
        self.status = .loading
     //  if let heroe = heroe{
            debugPrint("heroeid = \(heroe.id)")
            URLSession.shared.dataTaskPublisher(for: Networking.shared.getHeroeSeries(with: heroe.id, sortBy: .startYear))
                .tryMap {
                    guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
                       // debugPrint("URL: \($0.response.url)")
                        
                        throw URLError(.badServerResponse)
                        
                    }
                    debugPrint("ResponseCode: \(response.statusCode)")
                    return $0.data
                }
                .decode(type: SeriesResult.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink { completion in
                    switch completion{
                    case .failure:
                        debugPrint("Error. failure")
                    case .finished:
                        debugPrint("Success!")
                        self.status = .loadedHeroes
                    }
                } receiveValue: { seriesResult in
                    self.series = seriesResult.data.results
                }
                .store(in: &suscriptor)
      //  }
        

    }
    
    func getTestSeries(){
      
        let series1 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        let series2 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        
        let series3 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        
        let series4 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        
        //let series1 = Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", resourceURI: "http://gateway.marvel.com/v1/public/series/14569", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/series/14569/captain_america_and_the_first_thirteen_2011?utm_campaign=apiRef&utm_source=70c3542b3477f3734ce1952ea11618d0")], startYear: 2011, endYear: 2011, rating: "T+", type: "one shot", modified: "2019-09-20T20:11:50-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg), creators: Creators(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/creators", items: [], returned: 3), characters: Characters(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), stories: Stories(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), comics: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), events: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), next: nil, previous: nil)
        
      //  let series2 = Serie(id: 14569, title: "Captain America and the First Thirteen (2011) DOS", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", resourceURI: "http://gateway.marvel.com/v1/public/series/14569", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/series/14569/captain_america_and_the_first_thirteen_2011?utm_campaign=apiRef&utm_source=70c3542b3477f3734ce1952ea11618d0")], startYear: 2011, endYear: 2011, rating: "T+", type: "one shot", modified: "2019-09-20T20:11:50-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg), creators: Creators(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/creators", items: [], returned: 3), characters: Characters(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), stories: Stories(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), comics: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), events: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), next: nil, previous: nil)
        
       // let series3 = Serie(id: 14569, title: "Captain America and the First Thirteen (2011)TRES", description: nil, resourceURI: "http://gateway.marvel.com/v1/public/series/14569", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/series/14569/captain_america_and_the_first_thirteen_2011?utm_campaign=apiRef&utm_source=70c3542b3477f3734ce1952ea11618d0")], startYear: 2011, endYear: 2011, rating: "T+", type: "one shot", modified: "2019-09-20T20:11:50-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg), creators: Creators(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/creators", items: [], returned: 3), characters: Characters(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), stories: Stories(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), comics: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), events: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), next: nil, previous: nil)
        
       // let series4 = Serie(id: 14569, title: "Captain America and the First Thirteen (2011) CUATRO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", resourceURI: "http://gateway.marvel.com/v1/public/series/14569", urls: [URLElement(type: .detail, url: "http://marvel.com/comics/series/14569/captain_america_and_the_first_thirteen_2011?utm_campaign=apiRef&utm_source=70c3542b3477f3734ce1952ea11618d0")], startYear: 2011, endYear: 2011, rating: "T+", type: "one shot", modified: "2019-09-20T20:11:50-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg), creators: Creators(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/creators", items: [], returned: 3), characters: Characters(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), stories: Stories(available: 2, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 2), comics: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), events: Characters(available: 3, collectionURI: "http://gateway.marvel.com/v1/public/series/14569/characters", items: [], returned: 3), next: nil, previous: nil)
        
        self.series = [series1, series2,series3,series4]
    }
    
}
