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
    @Published var series: [Serie]? = []
    
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
        debugPrint("heroeid = \(heroe.id)")
        URLSession.shared.dataTaskPublisher(for: Networking.shared.getHeroeSeries(with: heroe.id, sortBy: .startYear))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
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
    }
    
    func getTestSeries(){
        
        let series1 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        let series2 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        
        let series3 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        
        let series4 =   Serie(id: 14569, title: "Captain America and the First Thirteen (2011) UNO", description: "Here goes the description, as you can see, there isn't any. So let's write some lines so we can check if the description field works as intended or not, but alas.", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/60/5696aeda0e63b", thumbnailExtension: .jpg))
        
        self.series = [series1, series2,series3,series4]
    }
}
