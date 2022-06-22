//
//  RestPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation
import UIKit
import CoreData

protocol RestViewPresenterProtocol: AnyObject {
    init(view: RestViewProtocol, user: User, coreDataHandler: CoreDataHandler, profileViewPresenter: ProfileViewPresenter)
    func changeUserState()
    func updateData(userState: String)
    func changePreferableWakeTime(newValue: Float)
    func convertValueToTimeString(_ value: Float) -> Time
    func getUserState() -> String
}

class RestViewPresenter: RestViewPresenterProtocol {
    
    // MARK: Variables
    
    let view: RestViewProtocol
    
    let user: User
    
    var coreDataHandler: CoreDataHandler
    
    var profileViewPresenter: ProfileViewPresenter
    
    // MARK: Initializations

    required init(view: RestViewProtocol, user: User, coreDataHandler: CoreDataHandler, profileViewPresenter: ProfileViewPresenter) {
        self.view = view
        self.user = user
        self.profileViewPresenter = profileViewPresenter
        self.coreDataHandler = coreDataHandler
        
        NotificationHandler.setNotification(withTitle: "Good Night :)", withBody: "It's time to sleep. See you tomorrow!", withTime: user.preferableSleepTime!, withIdentifier: NotificationIdentifiers.sleepTime, isRepeating: true)
    }
    
    // MARK: Functions
    
    func changeUserState() {
    
        self.view.showUserStateAnimation(userState: user.state!)
        updateData(userState: user.state!)
        coreDataHandler.changeUserState()
        if profileViewPresenter.sleepTimeView != nil {
            profileViewPresenter.updateGraphs()
            print(113213123123)
        }
        
        if user.state == "awake" {
            NotificationHandler.setNotification(withTitle: "Good morning :)", withBody: "It's time to wake up. Have a good day!", withTime: user.preferableWakeTime!, withIdentifier: NotificationIdentifiers.wakeTime, isRepeating: true)
        } else {
            NotificationHandler.deleteAllNotifications(withIdentifier: NotificationIdentifiers.wakeTime)
        }
    }
    
    func updateData(userState: String) {
        if userState == "awake" {
            let sleepTime = SleepTime(context: coreDataHandler.getContext())
            sleepTime.date = Date()
            sleepTime.sleepTime = Time.getCurrentTime()
        } else if userState == "asleep" {
            let wakeTime = WakeTime(context: coreDataHandler.getContext())
            wakeTime.date = Date()
            wakeTime.wakeTime = Time.getCurrentTime()
            
            if let lastSleepDate = coreDataHandler.getLastObject(objectName: Entities.SleepTime)?.value(forKey: "date") as? Date {
                let sleepDurationMinutes = wakeTime.date!.minutesFromDate(date: lastSleepDate)
                if sleepDurationMinutes > 40 && sleepDurationMinutes < 960 {
                    let sleepDurationTime = SleepDurationTime(context: coreDataHandler.getContext())
                    sleepDurationTime.date = lastSleepDate
                    sleepDurationTime.sleepDurationTime = Time(minutes: sleepDurationMinutes)
                }
            }
        }
        
        coreDataHandler.saveContext()
    }
    
    func changePreferableWakeTime(newValue: Float) {
        coreDataHandler.changeUserPreferableWakeTime(newWakeTime: convertValueToTimeString(newValue))
        view.changePreferableWakeTimeLabel(newWakeTime: user.preferableWakeTime!)
        
        let currentTime = Time.getCurrentTime()
        let sleepDuration = currentTime.getTimeDifference(differentTime: user.preferableWakeTime!)
        print("\(currentTime.toString()) \(user.preferableWakeTime!.toString())")
        
        var sleepDurationColor = UIColor.systemRed
        
        if sleepDuration.hours >= 8 && sleepDuration.hours <= 10 {
            sleepDurationColor = UIColor.systemGreen
        }
        
        view.changeSleepDurationLabel(sleepDuration: sleepDuration, color: sleepDurationColor)
    }
    
    func convertValueToTimeString(_ value: Float) -> Time {
        let convertedValue = value * 5
        let hours = Int(((convertedValue / 60).rounded(.towardZero) + 18).truncatingRemainder(dividingBy: 24))
        let minutes = Int((convertedValue.truncatingRemainder(dividingBy: 60) / 5).rounded(.towardZero) * 5)
        return Time(hours: hours, minutes: minutes)
    }
    
    func getUserState() -> String {
        return user.state!
    }
}
