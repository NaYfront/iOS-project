//
//  Extensions.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 28.05.2022.
//

import Foundation
import UIKit
import AVFoundation

extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

extension UILabel {
    func makeCornerRadius(radius: Int) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = CGFloat(radius)
    }
}

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func compareToDate(comparedDate: Date) -> Bool {
        if self.get(.year) == comparedDate.get(.year) && self.get(.month) == comparedDate.get(.month) && self.get(.day) == comparedDate.get(.day) {
            return true
        }
        return false
    }
    
    func minutesFromDate(date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
}
