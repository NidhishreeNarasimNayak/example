//
//  User+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Nidhishree on 14/09/19.
//  Copyright © 2019 YML. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?

}
