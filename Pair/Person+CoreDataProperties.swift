//
//  Person+CoreDataProperties.swift
//  Pair
//
//  Created by Eva Marie Bresciano on 7/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var name: String?
    @NSManaged var group: Group?

}
