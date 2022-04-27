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
    
        @IBAction func buttonAction(_ sender: Any) {
        guard let button = sender as? UIButton else { return }

        switch button.tag {
        case 0:
            print("0")
        case 1:
            print("1")
        case 2:
            print("2")
        case 3:
            print("3")
        default:
            return
        }
    }
}

extension ListenViewController: ListenViewProtocol {
    func setGreeting(greeting: String) {
        print("setGreeting")
    }
}
