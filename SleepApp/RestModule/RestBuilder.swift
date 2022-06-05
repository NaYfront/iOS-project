//
//  RestBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit
import CoreData

protocol RestBuilder {
    static func createRestFirstScreen(coreDataHandler: CoreDataHandler, user: User, profileViewPresenter: ProfileViewPresenter) -> UIViewController
}

class RestModuleBuilder: RestBuilder {
    static func createRestFirstScreen(coreDataHandler: CoreDataHandler, user: User, profileViewPresenter: ProfileViewPresenter) -> UIViewController {
        let view = RestViewController()
        let presenter = RestViewPresenter(view: view, user: user, coreDataHandler: coreDataHandler, profileViewPresenter: profileViewPresenter)
        view.restViewPresenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Rest", image: UIImage(systemName: "moon.fill"), tag: 0)
        
        return view
    }
}
