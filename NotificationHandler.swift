//
//  NotificationHandler.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 04.06.2022.
//

import Foundation
import UserNotifications

enum NotificationIdentifiers {
    static let sleepTime = "SleepTimeIdentifier"
    static let wakeTime = "WakeTimeIdentifier"
}

class NotificationHandler {
    
    // MARK: Static Variables
    
    static let currentNotificationCenter = UNUserNotificationCenter.current()
    
    // MARK: Static Functions
    
    static func setNotification(withTitle title: String, withBody body: String, withTime time: Time, withIdentifier identifier: String, isRepeating repeats: Bool) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.body = body
        notificationContent.badge = NSNumber(value: 1)
        notificationContent.sound = .default
                        
        var datComp = DateComponents()
        datComp.hour = time.hours
        datComp.minute = time.minutes
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: datComp, repeats: repeats)
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: trigger)
        currentNotificationCenter.add(request) { (error : Error?) in
                            if let theError = error {
                                print(theError.localizedDescription)
                            }
                        }
    }
    
    static func deleteAllNotifications(withIdentifier identifier: String) {
        currentNotificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}
