//
//  Group.swift
//  Pair
//
//  Created by Eva Marie Bresciano on 7/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation
import CoreData


class Group: NSManagedObject {
    
    convenience init?(title: String, people: [Person], context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        
        guard let entity = NSEntityDescription.entityForName("Group", inManagedObjectContext: context) else {return nil}
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.title = title
        self.people = people



}
