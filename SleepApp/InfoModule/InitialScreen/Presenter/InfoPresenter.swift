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
    init(view: InfoViewProtocol, router: InfoRouterProtocol, cellContent: CellContent)
    var cellContent: CellContent { get set }
    func tapOnTheView(listenContent: ListenContent)
}

class InfoPresenter: InfoViewPresenterProtocol {
    // MARK: - Properties
    weak var view: InfoViewProtocol?
    var router: InfoRouterProtocol?
    var cellContent: CellContent
    
    // MARK: - Init
    required init(view: InfoViewProtocol, router: InfoRouterProtocol, cellContent: CellContent) {
        self.view = view
        self.router = router
        self.cellContent = cellContent
    }
    
    func tapOnTheView(listenContent: ListenContent) {
        router?.showInfoSecondScreen(listenContent: listenContent)
    }
}
