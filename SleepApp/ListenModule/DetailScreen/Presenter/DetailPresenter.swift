//
//  DetailPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 06.04.2022.
//

import Foundation
import UIKit

protocol DetailViewProtocol: AnyObject {
}

protocol DetailViewPresenterProtocol {
    init(view: DetailViewProtocol, router: RouterProtocol, detailContent: [DetailContent])
    var detailContent: [DetailContent] { get set }
    func tapOnTheView(listenContent: ListenContent)
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    // MARK: - Properties
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    var detailContent: [DetailContent]
    
    // MARK: - Init
    required init(view: DetailViewProtocol, router: RouterProtocol, detailContent: [DetailContent]) {
        self.view = view
        self.router = router
        self.detailContent = detailContent
    }
    
    func tapOnTheView(listenContent: ListenContent) {
        router?.showListenViewController(listenContent: listenContent)
    }
}
