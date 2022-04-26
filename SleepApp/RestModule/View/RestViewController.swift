//
//  RestViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

class RestViewController: UIViewController {

    var presenter: RestViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension RestViewController: RestViewProtocol {
    func setGreeting(greeting: String) {
        print("setGreeting")
    }
}
