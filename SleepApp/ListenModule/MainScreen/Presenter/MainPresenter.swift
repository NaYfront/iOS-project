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
    init(view: MainViewProtocol, content: [MainContent], router: RouterProtocol)
    var content: [MainContent] { get set }
    func tapOnTheView(detailContent: [DetailContent])
}

class MainPresenter: MainViewPresenterProtocol {
    // MARK: - Properties
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    var content: [MainContent]
    
    // MARK: - Init
    required init(view: MainViewProtocol, content: [MainContent], router: RouterProtocol) {
        self.view = view
        self.content = content
        self.router = router
    }
    
    func tapOnTheView(detailContent: [DetailContent]) {
        router?.showDetailViewController(detailContent: detailContent)
    }
}
