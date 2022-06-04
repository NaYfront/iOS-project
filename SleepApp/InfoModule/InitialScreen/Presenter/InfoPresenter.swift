//
//  InfoPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation

protocol InfoViewProtocol: AnyObject {

}

protocol InfoViewPresenterProtocol: AnyObject {
    init(view: InfoViewProtocol)
}

class InfoPresenter: InfoViewPresenterProtocol {
    
    weak var view: InfoViewProtocol?
    
    required init(view: InfoViewProtocol) {
        self.view = view
    }
}
