//
//  RestPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation

protocol RestViewPresenterProtocol: class {
    init(view: RestViewProtocol, user: User)
    func changeUserState()
}

class RestPresenter: RestViewPresenterProtocol {
    let view: RestViewProtocol
    let user: User
    
    required init(view: RestViewProtocol, user: User) {
        self.view = view
        self.user = user
    }
    
    func changeUserState() {
        user.changeState()
        self.view.showUserStateAnimation(userState: user.currentState)
    }
}
