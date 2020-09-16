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

    func favTapped(id: Int, titleGames: String, releaseGames: String, ratingGames: Int, img: String, isThere: Bool) {
 
        if !isThere {
            
            gamesProvider.createData(id, titleGames, releaseGames, img, ratingGames) {
                DispatchQueue.main.async {
                    Utilities.showAlert(controller: self, message: "Data berhasil disimpan !", seconds: 1)
                }
            }

        } else {
            
            gamesProvider.deleteData(id) {
                DispatchQueue.main.async {
                    Utilities.showAlert(controller: self, message: "Data berhasil dihapus ", seconds: 1)
                }
            }
        }

    }
    
}
