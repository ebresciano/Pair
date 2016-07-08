//
//  GroupController.swift
//  Pair
//
//  Created by Eva Marie Bresciano on 7/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation
import CoreData

class GroupController {
    
    var fetchedResultsController: NSFetchedResultsController
    
    static let sharedController = GroupController()
    
    init() {
        let request = NSFetchRequest(entityName: "Person")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext , sectionNameKeyPath: "name", cacheName: nil)
        _ = try? fetchedResultsController.performFetch()
        
    }

    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("So sorry, failed to save to persistent storage \(#file) \(#function) \(#line)")
        }
    }
      
    func addPersonToGroup(name: String) {
        _ = Person(name: name)
        saveToPersistentStorage()
    }
    
    func removePersonFromGroup(person: Person) {
        let moc = Stack.sharedStack.managedObjectContext
        moc.deleteObject(person)
        saveToPersistentStorage()
        
    }

}
