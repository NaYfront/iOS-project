//
//  RestBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit
import CoreData

protocol RestBuilder {
    static func createRestFirstScreen() -> UIViewController
}

class RestModuleBuilder: RestBuilder {
    static func createRestFirstScreen() -> UIViewController {
        let view = RestViewController()
        let presenter = RestViewPresenter(view: view, user: User(preferableWakeTime: Time(hours: 0, minutes: 0)))
        view.restViewPresenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Rest", image: UIImage(systemName: "moon.fill"), tag: 0)
        
        return view
    }
}
