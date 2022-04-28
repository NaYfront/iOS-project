//
//  User.swift
//  SleepApp
//
//  Created by Arslan Rashidov on 27.04.2022.
//

import Foundation

enum UserStates {
    case awake, asleep
}

class User {
    var preferableWakeTime: String
    
    var currentState: UserStates
    
    init(preferableWakeTime: String) {
        self.preferableWakeTime = preferableWakeTime
        self.currentState = UserStates.awake
    }
    
    func changeState() {
        if currentState == UserStates.awake {
            self.currentState = UserStates.asleep
        }
        else {
            self.currentState = UserStates.awake
        }
    }
}
