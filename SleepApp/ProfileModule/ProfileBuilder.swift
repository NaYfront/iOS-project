//
//  ProfileBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol ProfileBuilder {
    static func createProfileFirstScreen() -> UIViewController
}

class ProfileModuleBuilder: ProfileBuilder {
    static func createProfileFirstScreen() -> UIViewController {
        let view = ProfileViewController()
        let presenter = ProfilePresenter(view: view)
        view.presenter = presenter
        
        view.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        
        return view
    }
}
