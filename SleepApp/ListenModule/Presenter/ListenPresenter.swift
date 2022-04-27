//
//  ListenPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation
import UIKit

protocol ListenViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol ListenViewPresenterProtocol: AnyObject {
    init(view: ListenViewProtocol, content: [ModuleContent])
    var content: [ModuleContent] { get set }
}

class ListenPresenter: ListenViewPresenterProtocol {
    let view: ListenViewProtocol
    var content: [ModuleContent]
    
    required init(view: ListenViewProtocol, content: [ModuleContent]) {
        self.view = view
        self.content = content
    }
}
