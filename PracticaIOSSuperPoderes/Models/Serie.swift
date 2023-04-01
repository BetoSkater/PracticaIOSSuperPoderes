//
//  Serie.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import Foundation


// MARK: - SeriesResult
struct SeriesResult: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassSeries
}

// MARK: - DataClass
struct DataClassSeries: Codable {
    let offset, limit, total, count: Int
    let results: [Serie]
}

//// MARK: - Result
//struct Serie: Codable, Identifiable {
//    let id: Int
//    let title: String
//    let description: String?
//    let resourceURI: String?
//    let urls: [URLElement]?
//    let startYear, endYear: Int?
//    let rating, type: String?
//    let modified: String?
//    let thumbnail: Thumbnail?
//    let creators: Creators?
//    let characters: Characters?
//    let stories: Stories?
//    let comics, events: Characters?
//    let next, previous: JSONNull?
//}
// MARK: - Result
struct Serie: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
  //  let resourceURI: String?
  //  let urls: [URLElement]?
  //  let startYear, endYear: Int?
  //  let rating, type: String?
  //  let modified: String?
    let thumbnail: Thumbnail
   // let creators: Creators?
  //  let characters: Characters?
   // let stories: Stories?
   // let comics, events: Characters?
   // let next, previous: JSONNull?
}
// MARK: - Characters
struct Characters: Codable {
    let available: Int
    let collectionURI: String
    let items: [CharactersItem]?
    let returned: Int
}

// MARK: - CharactersItem
struct CharactersItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]?
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name, role: String
}
/*
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
    let type: TypeEnum
}

enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}
 */

// MARK: - Thumbnail
struct ThumbnailSerie: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

/*
// MARK: - URLElement
struct URLElement: Codable {
    let type: String
    let url: String
}
*/
// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
 
}
 
