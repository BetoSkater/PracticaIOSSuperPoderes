//
//  Serie.swift
//  PracticaIOSSuperPoderes
//
//  Created by Alberto Junquera Ramírez on 26/3/23.
//

import Foundation

///Structs needed to decode the desired data form the Series Api Call

// MARK: - SeriesResult -
struct SeriesResult: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassSeries
}

// MARK: - DataClass -
struct DataClassSeries: Codable {
    let offset, limit, total, count: Int
    let results: [Serie]
}

// MARK: - Serie -
struct Serie: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
}
