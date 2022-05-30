//
//  ListenBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol ListenBuilder {
    static func createListenFirstScreen() -> UINavigationController
}

class ListenModuleBuilder: ListenBuilder {
    static func createListenFirstScreen() -> UINavigationController {
        let view = ListenViewController()
        let presenter = ListenPresenter(view: view)
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Listen", image: UIImage(systemName: "headphones"), tag: 0)
        view.title = "Listen"
        
        return UINavigationController(rootViewController: view)
    }
}
