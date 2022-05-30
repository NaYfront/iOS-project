//
//  Time.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 28.05.2022.
//

import Foundation

public class Time: NSObject, NSCoding {
    
    var hours: Int
    var minutes: Int
    
    override init() {
        self.hours = 0
        self.minutes = 0
        super.init()
    }
    
    init(minutes: Int) {
        self.hours = Int(minutes / 60)
        self.minutes = minutes - self.hours * 60
        super.init()
    }
    
    init(hours: Int, minutes: Int) {
        self.hours = hours
        self.minutes = minutes
        super.init()
    }
    
    public required convenience init?(coder: NSCoder) {
        let hours = coder.decodeInteger(forKey: "Hours")
        let minutes = coder.decodeInteger(forKey: "Minutes")
        self.init(hours: hours, minutes: minutes)
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(hours, forKey: "Hours")
        coder.encode(minutes, forKey: "Minutes")
    }
    
    static func getCurrentTime() -> Time {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateFormat = "a"
        let timeReference = formatter.string(from: Date())
        
        formatter.dateFormat = "hh"
        var hours = formatter.string(from: Date())
        
        formatter.dateFormat = "mm"
        let minutes = formatter.string(from: Date())
        
        if timeReference == "AM" {
            if hours == "12" {
                hours = "\(Int(hours)! - 12)"
            }
        } else if timeReference == "PM" {
            if hours != "12" {
                hours = "\(Int(hours)! + 12)"
            }
        }

        return Time(hours: Int(hours)!, minutes: Int(minutes)!)
    }
    
    func toString() -> String {
        var hoursString = String(self.hours)
        var minutesString = String(self.minutes)
        if hoursString.count == 1 {
                hoursString = "0\(hoursString)"
        }
        if minutesString.count == 1 {
            minutesString = "0\(minutesString)"
        }
        return hoursString + ":" + minutesString
    }
    
    func getTimeDifference(differentTime: Time) -> Time {
        var timeInterval = differentTime.getSeconds() - self.getSeconds()
        if timeInterval < 0 {
            timeInterval = 86400 - (-1 * timeInterval)
        }
        
        let hours: Int = timeInterval / 3600
        let minutes: Int = (timeInterval - (hours * 3600)) / 60
        
        return Time(hours: hours, minutes: minutes)
    }
    
    func getSeconds() -> Int {
        return hours * 3600 + minutes * 60
    }
}
