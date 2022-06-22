//
//  InfoDetailPresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.06.2022.
//

import Foundation
import UIKit

protocol InfoDetailViewProtocol: AnyObject {
    func changeImage(image: UIImage?, constraint: NSLayoutConstraint!, imageView: UIImageView!)
}

protocol InfoDetailViewPresenterProtocol: AnyObject {
    init(view: InfoDetailViewProtocol, content: ListenContent, router: InfoRouterProtocol)
    var content: ListenContent { get set }
}

class InfoDetailPresenter: InfoDetailViewPresenterProtocol {
    // MARK: - Properties
    weak var view: InfoDetailViewProtocol?
    var router: InfoRouterProtocol?
    var content: ListenContent
    
    // MARK: - Init
    required init(view: InfoDetailViewProtocol, content: ListenContent, router: InfoRouterProtocol) {
        self.view = view
        self.content = content
        self.router = router
    }
}
