//
//  Networking.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 24/3/23.
//

import Foundation

enum auth:String{
    case ts = "1"
    case apikey = "70c3542b3477f3734ce1952ea11618d0"
    case hash = "6423f50f3bcfcaa65516d29bcf4298ba"
}

enum OrderBy:String{
    case formerModified = "-modified"
    case recentModified = "modified"
    case startYear = "startYear"
}

enum EndPoints:String{
    case baseURL = "https://gateway.marvel.com"
    case heroes = "/v1/public/characters"
    case series = "/series"
}

enum ApiMethods:String{
    case get = "GET"
    case post = "POST"
}

final class Networking{
    
    static let shared = Networking()
    
    //MARK: - getMarvelHeroes(...). Retrieven the marvel heroes List -
    
    /// Method to generate the URLRequest needed to launch an API call to retrieve 20 heroes.
    /// - Parameter orderMethod: Needed to customize how the heroes list order would be retrieved. Example: Ordered by last added, recently modified, etc.
    /// - Returns: Returns the URLRequest needed in order to  perform the API call to retrieve 20 marvel heroes.
    func getMarvelHeroes(sortBy orderMethod: OrderBy) -> URLRequest{
        
        //URL generation
        let accessAuth = "?ts=\(auth.ts.rawValue)&apikey=\(auth.apikey.rawValue)&hash=\(auth.hash.rawValue)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlString = "\(EndPoints.baseURL.rawValue)\(EndPoints.heroes.rawValue)\(accessAuth)\(sortBy)"
        let url = URL(string: urlString)
        
        //Request
        var request = URLRequest(url: url!)
        request.httpMethod = ApiMethods.get.rawValue
        
        return request
        
    }
    
    //MARK: - Retrieve all the series from an specifc character -
    
    /// Method to generate the URLRequest needed to launch an API call to retrieve the series in which a given character appears.
    /// - Parameters:
    ///   - heroeId: Int. The heroe identifier parameter, needed to locate all the series in which the heroe appears.
    ///   - orderMethod: Enum OrderBy. Needed to set how the retrieved data will be arrenged.
    /// - Returns: The URLRequest to lauch the API call to retrieve the series form one certain heroe.
    func getHeroeSeries(with heroeId: Int, sortBy orderMethod: OrderBy) -> URLRequest{
        //URL generation
        let accessAuth = "?ts=\(auth.ts.rawValue)&apikey=\(auth.apikey.rawValue)&hash=\(auth.hash.rawValue)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlString = "\(EndPoints.baseURL.rawValue)\(EndPoints.heroes.rawValue)/\(heroeId)\(EndPoints.series.rawValue)\(accessAuth)\(sortBy)"
        let url = URL(string: urlString)
        
        //Request
        var request = URLRequest(url: url!)
        request.httpMethod = ApiMethods.get.rawValue
        
        return request
    }
    
}
