//
//  ProfileViewController.swift
//  Sleep App
//
//  Created by Алексей Горбунов on 27.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var wakeupTimeLabel: UILabel!
    @IBOutlet weak var sleepDurationLabel: UILabel!

    // MARK: - Properties
    internal var sleepDurationTime = "8h"
    internal var wakeupTime = "6:00"
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configure()
    }
    
    // MARK: - Action
    @IBAction func sleepDurationAlert(_ sender: Any) {
        showAlert(title: "Sleep Duration", message: "The duration of sleep will help you create the right sleep plan. It is not necessary to have a clear time, but it is desirable to have a difference of no more than 30 minutes")
    }
    
    @IBAction func settingsAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        guard let editVC = storyboard.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController else { return }
        
        editVC.delegate = self
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    // MARK: - Private Functions
    private func configure() {
        wakeupTimeLabel.text = wakeupTime
        sleepDurationLabel.text = sleepDurationTime
    }
    
    private func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: { _ in
            alert.dismiss(animated: true)
        }))
        alert.view.tintColor = UIColor(named: "iceGreen")
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Profile View Controller Delegate
extension ProfileViewController: ProfileViewControllerDelegate {
    func saveTime(time: String, flag: Bool) {
        if flag {
            sleepDurationTime = time
        } else {
            wakeupTime = time
        }
    }
}
