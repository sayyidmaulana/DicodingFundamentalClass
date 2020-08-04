//
//  DevModelsDetails.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 29/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let developersDetails = try? newJSONDecoder().decode(DevelopersDetails.self, from: jsonData)

import Foundation

// MARK: - DevelopersDetails
struct DevelopersDetails: Codable {
    let id: Int?
    let name: String?
    let gamesCount: Int?
    let imageBackground: String?
    let developersDetailsDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case developersDetailsDescription = "description"
    }
}
