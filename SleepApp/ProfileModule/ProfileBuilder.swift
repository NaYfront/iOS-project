//
//  ProfileBuilder.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol ProfileBuilder {
    static func createProfileFirstScreen(coreDataHandler: CoreDataHandler) -> (UIViewController, ProfileViewPresenter)
}

class ProfileModuleBuilder: ProfileBuilder {    
    static func createProfileFirstScreen(coreDataHandler: CoreDataHandler) -> (UIViewController, ProfileViewPresenter) {
        let profileViewController = ProfileViewController()
        let profileViewPresenter = ProfileViewPresenter(profileView: profileViewController, coreDataHandler: coreDataHandler)
        profileViewController.profileViewPresenter = profileViewPresenter
        
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
        
        return (profileViewController,profileViewPresenter)
    }
}
