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
    init(view: RestViewProtocol, user: User)
    func changeUserState()
    func updateData(userState: UserStates)
    func changePreferableWakeTime(newValue: Float)
    func convertValueToTimeString(_ value: Float) -> Time
}

class RestViewPresenter: RestViewPresenterProtocol {
    let view: RestViewProtocol
    let user: User
    var coreDataHandler: CoreDataHandler

    required init(view: RestViewProtocol, user: User) {
        self.view = view
        self.user = user
        self.coreDataHandler = CoreDataHandler()
    }
    
    func changeUserState() {
        self.view.showUserStateAnimation(userState: user.currentState)
        updateData(userState: user.currentState)
        user.changeState()
    }
    
    func updateData(userState: UserStates) {
        if userState == UserStates.awake {
            let sleepTime = SleepTime(context: coreDataHandler.getContext())
            sleepTime.date = Date()
            sleepTime.sleepTime = Time.getCurrentTime()
        } else if userState == UserStates.asleep {
            let wakeTime = WakeTime(context: coreDataHandler.getContext())
            wakeTime.date = Date()
            wakeTime.wakeTime = Time.getCurrentTime()
            
            if let lastSleepDate = coreDataHandler.getLastObject(objectName: Entities.SleepTime)?.value(forKey: "date") as? Date {
                let sleepDurationMinutes = wakeTime.date!.minutesFromDate(date: lastSleepDate)
                if sleepDurationMinutes > 40 {
                    let sleepDurationTime = SleepDurationTime(context: coreDataHandler.getContext())
                    sleepDurationTime.date = lastSleepDate
                    sleepDurationTime.sleepDurationTime = Time(minutes: sleepDurationMinutes)
                }
            }
        }
        
        coreDataHandler.saveContext()

    }
    
    func changePreferableWakeTime(newValue: Float) {
        user.preferableWakeTime = convertValueToTimeString(newValue)
        view.changePreferableWakeTimeLabel(newWakeTime: user.preferableWakeTime)
        
        let currentTime = Time.getCurrentTime()
        let sleepDuration = currentTime.getTimeDifference(differentTime: user.preferableWakeTime)
        print("\(currentTime.toString()) \(user.preferableWakeTime.toString())")
        
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
}
