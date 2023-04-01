//
//  Heroes.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 25/3/23.
//

import Foundation
//MARK: - Request Header Data -
struct RequestData: Codable{
    let code: Int
    let status: String
    let copyright: String
    let attributionText:String
    let attributionHTML:String
    let etag:String
    let data: DataClass
    
}

 //MARK: - DataClass -
struct DataClass: Codable{
    let offset: Int
    let limit:Int
    let total:Int
    let count: Int
    let results: [Heroe]
}
 
//MARK: - Heroe -
struct Heroe: Codable, Identifiable{
   let id: Int
   let name: String
   let description: String
   let thumbnail: Thumbnail
}

// MARK: - Thumbnail -
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case jpg = "jpg"
}

