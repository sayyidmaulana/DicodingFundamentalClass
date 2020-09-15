//
//  FavoriteGamesProvider.swift
//  DicodingFundamental
//
//  Created by Sayyid Maulana Khakul Y on 13/09/20.
//  Copyright © 2020 Dicoding. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class FavoriteGamesProvider {
    private func newTaskContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let taskContext = appDelegate.persistentContainer.newBackgroundContext()
        taskContext.undoManager = nil
        
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    
    func getAllData(completion: @escaping(_ members: [Result]) -> ()){
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteModel")
            do {
                let results = try taskContext.fetch(fetchRequest)
                var members: [Result] = []
                for result in results {
                    let member = Result(
                        id: result.value(forKey: "id") as? Int,
                        name: result.value(forKey: "name") as? String,
                        released: result.value(forKey: "released") as? String,
                        backgroundImage: result.value(forKey: "backgroundImage") as? String,
                        rating: result.value(forKey: "rating") as? Double,
                        ratingTop: result.value(forKey: "ratingTop") as? Int,
                        ratingsCount: result.value(forKey: "ratingsCount") as? Int
                        )
                    members.append(member)
                }
                completion(members)
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
    func getData(_ id: Int, completion: @escaping(_ members: Result) -> ()){
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteModel")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            do {
                if let result = try taskContext.fetch(fetchRequest).first{
                    let member = Result(
                        id: result.value(forKey: "id") as? Int,
                        name: result.value(forKey: "name") as? String,
                        released: result.value(forKey: "released") as? String,
                        backgroundImage: result.value(forKey: "backgroundImage") as? String,
                        rating: result.value(forKey: "rating") as? Double,
                        ratingTop: result.value(forKey: "ratingTop") as? Int,
                        ratingsCount: result.value(forKey: "ratingsCount") as? Int
                        )
                    completion(member)
                }
            } catch let error as NSError {
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
    }
    
}
