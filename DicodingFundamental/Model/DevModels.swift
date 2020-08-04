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
    let results: [DevResult]?
}

// MARK: - Result
struct DevResult: Codable {
    let id: Int?
    let name: String?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageBackground = "image_background"
    }
}


