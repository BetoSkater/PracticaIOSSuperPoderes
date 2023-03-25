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
}

enum EndPoints:String{
    case baseURL = "https://gateway.marvel.com"
    case heroes = "/v1/public/characters"
}

enum ApiMethods:String{
    case get = "GET"
    case post = "POST"
}

final class Networking{
    
    static let shared = Networking()
    
   //MARK: - getMarvelHeroes(...). Retrieven the marvel heroes List -
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
    
}
