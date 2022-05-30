//
//  User.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 28.04.2022.
//

import Foundation

enum UserStates {
    case awake, asleep
}

class User {
    var preferableWakeTime: Time

    var currentState: UserStates

    init(preferableWakeTime: Time) {
        self.preferableWakeTime = preferableWakeTime
        self.currentState = UserStates.awake
    }

    func changeState() {
        if currentState == UserStates.awake {
            self.currentState = UserStates.asleep
        } else {
            self.currentState = UserStates.awake
        }
    }
}
