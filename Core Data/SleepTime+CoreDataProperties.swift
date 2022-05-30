//
//  SleepTime+CoreDataProperties.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 29.05.2022.
//
//

import Foundation
import CoreData

extension SleepTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SleepTime> {
        return NSFetchRequest<SleepTime>(entityName: "SleepTime")
    }

    @NSManaged public var date: Date?
    @NSManaged public var sleepTime: NSObject?
}

extension SleepTime : Identifiable {
    
}
