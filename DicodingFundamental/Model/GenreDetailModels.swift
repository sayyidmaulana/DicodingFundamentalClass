//
//  GenreDetailModels.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailGenre = try? newJSONDecoder().decode(DetailGenre.self, from: jsonData)

import Foundation

// MARK: - DetailGenre
struct DetailGenre: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String
    let detailGenreDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case detailGenreDescription = "description"
    }
}
