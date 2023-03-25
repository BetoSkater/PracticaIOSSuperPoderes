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
struct Heroe: Codable{
    let id: Int
    let name: String
    let description: String
    let modified: String
    //let modified: Date //TODO: With date, it gives an Error, with String it works perfectly
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics: Comics
    let series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case jpg = "jpg"
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}

