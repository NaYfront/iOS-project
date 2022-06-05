//
//  GraphDataSource.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 02.06.2022.
//

import Foundation
import CoreData

enum Months {
    static func getMonth(byNumber number: Int) -> String {
        switch(number) {
        case 1:
            return "JAN"
        case 2:
            return "FEB"
        case 3:
            return "MAR"
        case 4:
            return "APR"
        case 5:
            return "MAY"
        case 6:
            return "JUN"
        case 7:
            return "JUL"
        case 8:
            return "AUG"
        case 9:
            return "SEP"
        case 10:
            return "OCT"
        case 11:
            return "NOV"
        case 12:
            return "DEC"
        default:
            return "JAN"
        }
    }
}

class DataOnDate {
    var value: Double
    var date: Date
    
    init(value: Double, date: Date) {
        self.value = value
        self.date = date
    }
}

protocol GraphDataSourceProtocol {
    func value(forIdentifier identifier: String, atIndex pointIndex: Int) -> Double
    func label(atIndex pointIndex: Int) -> String
    func numberOfPoints() -> Int
}

class GraphDataSource {
    
    // MARK: Variables
    
    var dataSource: [NSManagedObject]
    var identifier: String
    var dataSourceToDisplay: [DataOnDate]
    
    // MARK: Initializations
    
    init(dataSource: [NSManagedObject], withIdentifier identifier: String) {
        self.dataSource = dataSource
        self.identifier = identifier
        self.dataSourceToDisplay = [DataOnDate]()
        
        var needDate = Date()
        for _ in 0..<7 {
            if let object = self.getNeedDateObject(needDate: needDate) {
                switch identifier {
                    case "SleepTimeGraph":
                        if let time = object.value(forKey: "sleepTime") as? Time {
                            let value: Double = Double(time.hours) + Double(time.minutes) / 100
                            dataSourceToDisplay.append(DataOnDate(value: value, date: needDate))
                            } else {
                                dataSourceToDisplay.append(DataOnDate(value: 0, date: needDate))
                            }
                    case "WakeTimeGraph":
                    if let time = object.value(forKey: "wakeTime") as? Time {
                        let value: Double = Double(time.hours) + Double(time.minutes) / 100
                        dataSourceToDisplay.append(DataOnDate(value: value, date: needDate))
                        } else {
                            dataSourceToDisplay.append(DataOnDate(value: 0, date: needDate))
                        }
                    case "SleepDurationTimeGraph":
                    if let time = object.value(forKey: "sleepDurationTime") as? Time {
                        let value: Double = Double(time.hours) + Double(time.minutes) / 100
                        dataSourceToDisplay.append(DataOnDate(value: value, date: needDate))
                        } else {
                            dataSourceToDisplay.append(DataOnDate(value: 0, date: needDate))
                        }
                    default:
                    dataSourceToDisplay.append(DataOnDate(value: 0, date: needDate))
                }
            } else {
                dataSourceToDisplay.append(DataOnDate(value: 0, date: needDate))
            }
            needDate = needDate.dayBefore
        }
        
        dataSourceToDisplay.reverse()
    }
    
    // MARK: Functions
    
    func value(forIdentifier identifier: String, atIndex pointIndex: Int) -> Double {
        return self.dataSourceToDisplay[pointIndex].value
    }
    
    func label(atIndex pointIndex: Int) -> String {
        let date = dataSourceToDisplay[pointIndex].date
        let monthNumber = date.get(.month)
        let dayNumber = date.get(.day)
        
        return "\(String(monthNumber).count > 1 ? String(monthNumber): "0" + String(monthNumber)).\(String(dayNumber).count > 1 ? String(dayNumber): "0" + String(dayNumber))"
    }
    
    func numberOfPoints() -> Int {
        print(dataSourceToDisplay.count)
        return dataSourceToDisplay.count
    }
    
    func getNeedDateObject(needDate: Date) -> NSManagedObject? {
        for object in dataSource {
            if let date = object.value(forKey: "date") as? Date {
                if date.get(.day) == needDate.get(.day) && date.get(.month) == needDate.get(.month) && date.get(.year) == needDate.get(.year) {
                    return object
                }
            }
        }
        return nil
    }
}
