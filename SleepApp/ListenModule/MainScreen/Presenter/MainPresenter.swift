//
//  ListenPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, content: [MainContent])
    var content: [MainContent] { get set }
}

class MainPresenter: MainViewPresenterProtocol {
    // MARK: - Properties
    weak var view: MainViewProtocol?
    var content: [MainContent]
    
    // MARK: - Init
    required init(view: MainViewProtocol, content: [MainContent]) {
        self.view = view
        self.content = content
    }
}
