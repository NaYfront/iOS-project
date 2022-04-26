//
//  ListenPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation

protocol ListenViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol ListenViewPresenterProtocol: AnyObject {
    init(view: ListenViewProtocol)
    func showGreeting()
}

class ListenPresenter: ListenViewPresenterProtocol {
    let view: ListenViewProtocol
    
    required init(view: ListenViewProtocol) {
        self.view = view
    }
    
    func showGreeting() {
        print("showGreeting")
    }
}
