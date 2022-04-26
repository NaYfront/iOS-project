//
//  InfoBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol InfoBuilder {
    static func createInfoFirstScreen() -> UINavigationController
}

class InfoModuleBuilder: InfoBuilder {
    static func createInfoFirstScreen() -> UINavigationController {
        let view = InfoViewController()
        let presenter = InfoPresenter(view: view)
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Rest", image: UIImage(systemName: "book.fill"), tag: 0)
        view.title = "Discover"
        
        return UINavigationController(rootViewController: view)
    }
}
