//
//  DevModels.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 29/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let developers = try? newJSONDecoder().decode(Developers.self, from: jsonData)

import Foundation

// MARK: - Developers
struct Developers: Codable {
    let count: Int?
    let next: String?
    let previous: JSONNull?
    let results: [DevResult]?
}

// MARK: - Result
struct DevResult: Codable {
    let id: Int?
    let name, slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let games: [DevGame]?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case games
    }
}

// MARK: - Game
struct DevGame: Codable {
    let id: Int?
    let slug, name: String?
    let added: Int?
}

