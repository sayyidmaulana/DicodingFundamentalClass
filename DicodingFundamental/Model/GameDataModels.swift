//
//  GameDataModels.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import Foundation

struct DataGames: Codable {
    let result: [Results]?
}
    struct Results: Codable {
        let id: Int?
        let name: String?
        let released: String?
        let rating_top: Int?
        let background_image: String?
    }
