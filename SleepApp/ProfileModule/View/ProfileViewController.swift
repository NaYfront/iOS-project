//
//  ProfileViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var presenter: ProfileViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ProfileViewController: ProfileViewProtocol {
    func setGreeting(greeting: String) {
        print("setGreeting")
    }
}
