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
    
    func createData(_ id:Int, _ name:String, _ released:String, _ background_image:String, _ rating_top:Int, completion: @escaping() -> ()){
        let taskContext = newTaskContext()
        taskContext.performAndWait {
            if let entity = NSEntityDescription.entity(forEntityName: "FavoriteModel", in: taskContext) {
                let member = NSManagedObject(entity: entity, insertInto: taskContext)
                member.setValue(id, forKeyPath: "id")
                member.setValue(name, forKeyPath: "name")
                member.setValue(released, forKeyPath: "released")
                member.setValue(background_image, forKeyPath: "backgroundImage")
                member.setValue(rating_top, forKeyPath: "ratingsCount")
                do {
                    try taskContext.save()
                    completion()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
    func deleteData(_ id: Int, completion: @escaping() -> ()){
        let taskContext = newTaskContext()
        taskContext.perform {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavoriteModel")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "id == \(id)")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            if let batchDeleteResult = try? taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult,
                batchDeleteResult.result != nil {
                completion()
            }
        }
    }
    
}
