//
//  InfoPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation

protocol InfoViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol InfoViewPresenterProtocol: AnyObject {
    init(view: InfoViewProtocol)
    func showGreeting()
}

class InfoPresenter: InfoViewPresenterProtocol {
    let view: InfoViewProtocol
    
    required init(view: InfoViewProtocol) {
        self.view = view
    }
    
    func showGreeting() {
        print("showGreeting")
    }
}
