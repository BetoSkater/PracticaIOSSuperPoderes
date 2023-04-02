//
//  HeroesTableViewModel.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 25/3/23.
//

import Foundation
import Combine

final class HeroesTableViewModel: ObservableObject{
    @Published var heroes: [Heroe]?
    @Published var status = Status.none
    
    
    var suscriptors = Set<AnyCancellable>()
    
    
    init(testing:Bool = false){
        if !testing{
            self.getHeroes(sortBy: .formerModified)
        }else{
            self.testingHeroes()
        }
    }
    
    func getHeroes(sortBy order: OrderBy){
        self.status = .loading
        URLSession.shared.dataTaskPublisher(for: Networking.shared.getMarvelHeroes(sortBy: .formerModified))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else{
                    //debugPrint("URL: \($0.response.url)")
                    throw URLError(.badServerResponse)
                    
                }
                return $0.data
            }
            .decode(type: RequestData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                case .failure:
                    debugPrint("Completrion . failure:")
                    self.status = .error(errorMsg: "Error: Failure at retrieven the heroes")
                case.finished:
                    debugPrint("Completrion . finished")
                    self.status = .loadedHeroes
                }
            } receiveValue: { requestData in
                self.heroes = requestData.data.results
            }
            .store(in: &suscriptors)
    }
    
    func testingHeroes() -> (){
        let heroe1 = Heroe(id: 95865, name: "Ramonchu", description: "Ram", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg))
        let heroe2 = Heroe(id: 295865, name: "Ramonchu2", description: "Ram2", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: .jpg))
        
        self.heroes = [heroe1, heroe2]
    }
}
