//
//  ListenPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 27.05.2022.
//

import Foundation
import UIKit

protocol ListenViewProtocol: AnyObject {
    func configure()
}

protocol ListenViewPresenterProtocol: AnyObject {
    init(view: ListenViewProtocol, content: ListenContent, router: RouterProtocol)
    var content: ListenContent { get set }
}

class ListenPresenter: ListenViewPresenterProtocol {
    // MARK: - Properties
    weak var view: ListenViewProtocol?
    var router: RouterProtocol?
    var content: ListenContent
    
    // MARK: - Init
    required init(view: ListenViewProtocol, content: ListenContent, router: RouterProtocol) {
        self.view = view
        self.content = content
        self.router = router
    }
}
