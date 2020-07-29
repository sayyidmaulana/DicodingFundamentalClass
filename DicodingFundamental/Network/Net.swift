//
//  Net.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 12/07/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

let SERVER = "https://api.rawg.io/"

let genre = SERVER + "api/genres"

let endPointGames = SERVER + "api/games"

let dev = SERVER + "api/developers"

let detailGenre = "api/genres/"

let detailGames = "api/games/"

let detailDev = "api/developers/"


func filterGenre(genre_id: String) -> String {
    return SERVER + detailGenre + genre_id
}

func filterGames(games_id: String) -> String {
    return SERVER + detailGames + games_id
}

func filterDev(dev_id: String) -> String {
    return SERVER + detailDev + dev_id
}
