//
//  GroupController.swift
//  Pair
//
//  Created by Eva Marie Bresciano on 7/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation

class GroupController {
    
    static let sharedController = GroupController()
    
    func saveToPersistentStorage() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("So sorry, failed to save to persistent storage \(#file) \(#function) \(#line)")
        }
    }
    
    func addPersonToGroup(name: String, group: Group) {
        person = Person(name: name, group: group)
        saveToPersistentStorage()
    }
    
    func removePersonFromGroup(person: Person) {
        let moc = Stack.sharedStack.managedObjectContext
        moc.deleteObject(book)
        saveToPersistentStorage()
        
    }

}
