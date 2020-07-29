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
    let count: Int?
    let next, previous: JSONNull?
    let results: [GenreResult]?
}

// MARK: - Result
struct GenreResult: Codable {
    let id: Int?
    let name, slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let games: [GenreGame]?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case games
    }
}

// MARK: - Game
struct GenreGame: Codable {
    let id: Int?
    let slug, name: String?
    let added: Int?
}
