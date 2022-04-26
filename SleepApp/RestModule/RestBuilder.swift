//
//  RestBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol RestBuilder {
    static func createRestFirstScreen() -> UIViewController
}

class RestModuleBuilder: RestBuilder {
    static func createRestFirstScreen() -> UIViewController {
        let view = RestViewController()
        let presenter = RestPresenter(view: view)
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Rest", image: UIImage(systemName: "moon.fill"), tag: 0)
        
        return view
    }
}
