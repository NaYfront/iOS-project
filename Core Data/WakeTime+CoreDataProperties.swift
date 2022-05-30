//
//  WakeTime+CoreDataProperties.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 29.05.2022.
//
//

import Foundation
import CoreData

extension WakeTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WakeTime> {
        return NSFetchRequest<WakeTime>(entityName: "WakeTime")
    }

    @NSManaged public var wakeTime: NSObject?
    @NSManaged public var date: Date?

}

extension WakeTime : Identifiable {

}
