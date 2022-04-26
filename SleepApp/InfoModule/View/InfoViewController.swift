//
//  InfoViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    var presenter: InfoViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension InfoViewController: InfoViewProtocol {
    func setGreeting(greeting: String) {
        print("setGreeting")
    }
}
