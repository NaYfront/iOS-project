//
//  ProfilePresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation

protocol ProfileViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol)
    func showGreeting()
}

class ProfilePresenter: ProfileViewPresenterProtocol {
    let view: ProfileViewProtocol
    
    required init(view: ProfileViewProtocol) {
        self.view = view
    }
    
    func showGreeting() {
        print("showGreeting")
    }
}
