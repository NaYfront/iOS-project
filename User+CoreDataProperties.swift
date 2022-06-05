//
//  User+CoreDataProperties.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 05.06.2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var preferableSleepTime: Time?
    @NSManaged public var preferableWakeTime: Time?
    @NSManaged public var state: String?

}

extension User : Identifiable {

}
