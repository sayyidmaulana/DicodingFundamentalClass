//
//  ModelsGamesDetails.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 29/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import Foundation

struct DetailsGamesView: Codable {
    let id : Int?
    let name: String?
    let description: String?
    let background_image: String?
    let released: String?
    let ratings_count: Int?
}
