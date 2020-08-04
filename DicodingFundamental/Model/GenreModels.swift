//
//  GenreModels.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let detailGenreGames = try? newJSONDecoder().decode(DetailGenreGames.self, from: jsonData)

import Foundation

// MARK: - DetailGenreGames
struct DetailGenreGames: Codable {
    let results: [GenreResult]?
}

// MARK: - Result
struct GenreResult: Codable {
    let id: Int?
    let name: String?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageBackground = "image_background"
    }
}

