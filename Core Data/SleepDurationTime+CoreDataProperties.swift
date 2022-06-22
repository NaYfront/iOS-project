//
//  SleepDurationTime+CoreDataProperties.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 29.05.2022.
//
//

import Foundation
import CoreData

extension SleepDurationTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SleepDurationTime> {
        return NSFetchRequest<SleepDurationTime>(entityName: "SleepDurationTime")
    }

    @NSManaged public var sleepDurationTime: NSObject?
    @NSManaged public var date: Date?
}

extension SleepDurationTime : Identifiable {

}
