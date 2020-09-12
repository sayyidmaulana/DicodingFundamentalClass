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

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
               
       let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteModel", in: context)
        let newFav = NSManagedObject(entity: entity!, insertInto: context)
        newFav.setValue(id, forKey: "id")
        newFav.setValue(titleGames, forKey: "title")
        newFav.setValue(releaseGames, forKey: "releasee")
        newFav.setValue(ratingGames, forKey: "rating")
        newFav.setValue(img, forKey: "image")
        
        do {
            try context.save()
            Utilities.showAlert(controller: self, message: "Your favorite game added!", seconds: 1)
        } catch {
            Utilities.showAlert(controller: self, message: "Failed saving data", seconds: 1)
        }

    }
    
}
