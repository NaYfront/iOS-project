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
        let restViewController = RestViewController()
        let restPresenter = RestPresenter(view: restViewController, user: User(preferableWakeTime: "00:00"))
        restViewController.restPresenter = restPresenter
        
        restViewController.tabBarItem = UITabBarItem(title: "Rest", image: UIImage(systemName: "moon.fill"), tag: 0)
        
        return restViewController
    }
}
