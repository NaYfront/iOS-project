//
//  ListenPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation
import UIKit

protocol ListenViewProtocol: AnyObject {
}

protocol ListenViewPresenterProtocol: AnyObject {
    init(view: ListenViewProtocol, content: [MainContent])
    var content: [MainContent] { get set }
}

class ListenPresenter: ListenViewPresenterProtocol {
    weak var view: ListenViewProtocol?
    var content: [MainContent]
    
    required init(view: ListenViewProtocol, content: [MainContent]) {
        self.view = view
        self.content = content
    }
}
