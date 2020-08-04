//
//  GameModels.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let games = try? newJSONDecoder().decode(Games.self, from: jsonData)

import Foundation

// MARK: - Games
struct Games: Codable {
    let results: [Result]?
}


// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name, released: String?
    let backgroundImage: String?
    let rating: Double?
    let ratingTop: Int?
    let ratingsCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, released
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratingsCount = "ratings_count"
        
    }
}

