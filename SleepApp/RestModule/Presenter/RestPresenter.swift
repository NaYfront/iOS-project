//
//  RestPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation

protocol RestViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol RestViewPresenterProtocol: AnyObject {
    init(view: RestViewProtocol)
    func showGreeting()
}

class RestPresenter: RestViewPresenterProtocol {
    let view: RestViewProtocol
    
    required init(view: RestViewProtocol) {
        self.view = view
    }
    
    func showGreeting() {
        print("showGreeting")
    }
}
