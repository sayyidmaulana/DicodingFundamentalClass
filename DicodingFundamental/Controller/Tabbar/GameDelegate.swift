//
//  GameDelegate.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 30/08/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit
import CoreData

extension GameController: GameProtocol {

    func favTapped(id: Int, titleGames: String, releaseGames: String, ratingGames: Int, img: String) {

        gamesProvider.createData(id, titleGames, releaseGames, img, ratingGames) {
            DispatchQueue.main.async {
                Utilities.showAlert(controller: self, message: "Data Berhasil Disimpan !", seconds: 1)
            }
        }

    }
    
}
