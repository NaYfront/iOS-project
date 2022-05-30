//
//  ListenViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

class ListenViewController: UIViewController {

    var presenter: ListenViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListenViewController: ListenViewProtocol {
    func setGreeting(greeting: String) {
        print("setGreeting")
    }
}
