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
    init(view: DetailViewProtocol, detailContent: [DetailContent])
    var detailContent: [DetailContent] { get set }
}

class DetailPresenter: DetailViewPresenterProtocol {
    weak var view: DetailViewProtocol?
    var detailContent: [DetailContent]
    
    required init(view: DetailViewProtocol, detailContent: [DetailContent]) {
        self.view = view
        self.detailContent = detailContent
    }
}
