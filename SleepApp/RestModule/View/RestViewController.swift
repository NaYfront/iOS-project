//
//  RestViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol RestViewProtocol: AnyObject {
    func showUserStateAnimation(userState: String)
    func changePreferableWakeTimeLabel(newWakeTime: Time)
    func changeSleepDurationLabel(sleepDuration: Time, color: UIColor)
    func changeView()
}

class RestViewController: UIViewController {
    
    // MARK: Presenters

    var restViewPresenter: RestViewPresenterProtocol!
    
    // MARK: UI
    
    @IBOutlet weak var sleepDurationLabel: UILabel!
    
    @IBOutlet weak var sleepDurationTimeLabel: UILabel!
    
    @IBOutlet weak var wakeUpLabel: UILabel!
    
    @IBOutlet weak var wakeUpTimeLabel: UILabel!

    @IBOutlet weak var wakeUpView: UIView!
    
    @IBOutlet weak var timeCircle: TimeCircle!
    
    @IBOutlet weak var animationBackgroundView: UIView!

    @IBOutlet weak var currentStateImageView: UIImageView!

    @IBOutlet weak var currentStateLabel: UILabel!
    
    @IBOutlet weak var changeUserStatusButton: UIButton!
    
    // MARK: Actions
    
    @IBAction func changeUserStatusButtonAction(_ sender: Any) {
        self.restViewPresenter.changeUserState()
    }
    
    @IBAction func wakeUpButtonAction(_ sender: Any) {
        self.restViewPresenter.changeUserState()
    }
    
    // MARK: ViewController Lificycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animationBackgroundView.isHidden = false
        self.wakeUpView.alpha = 1
        
        if restViewPresenter.getUserState() == "asleep" {
            self.wakeUpView.isHidden = false
        }
        
        sleepDurationLabel.makeCornerRadius(radius: 20)
        sleepDurationTimeLabel.makeCornerRadius(radius: 20)
        wakeUpLabel.makeCornerRadius(radius: 20)
        wakeUpTimeLabel.makeCornerRadius(radius: 20)
        
        self.timeCircle.restViewPresenter = restViewPresenter
        self.timeCircle.lineWidth = 30
    }
}

extension RestViewController: RestViewProtocol {
    
    // MARK: Protocol Implementation
    
    func changeSleepDurationLabel(sleepDuration: Time, color: UIColor) {
        sleepDurationTimeLabel.text = "\(sleepDuration.toString())"
        sleepDurationTimeLabel.textColor = color
    }
    
    func showUserStateAnimation(userState: String) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let currentWindow = windowScene?.windows.first
        currentWindow?.addSubview(self.animationBackgroundView)

        userStateAnimate(userState: userState)
    }

    func userStateAnimate(userState: String) {
        if userState == "awake" {
            self.currentStateImageView.image = UIImage(systemName: "moon.zzz.fill")
            self.currentStateLabel.text = "Доброй ночи"
        } else {
            self.currentStateImageView.image = UIImage(systemName: "sun.and.horizon.fill")
            self.currentStateLabel.text = "Доброе утро"
        }

        UIView.animate(withDuration: 0.1) {
            self.animationBackgroundView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 1.5) {
                self.currentStateImageView.alpha = 1
                self.currentStateLabel.alpha = 1
                self.changeView()
            } completion: { _ in
                UIView.animate(withDuration: 1.5) {
                    self.currentStateImageView.alpha = 0
                    self.currentStateLabel.alpha = 0
                } completion: { _ in
                    UIView.animate(withDuration: 0.1) {
                        self.animationBackgroundView.alpha = 0
                    }
                }
            }
        }
    }
    
    func changePreferableWakeTimeLabel(newWakeTime: Time) {
        wakeUpTimeLabel.text = "\(newWakeTime.toString())"
    }
    
    func changeView() {
        if self.wakeUpView.isHidden {
            UIView.animate(withDuration: 1) {
                self.wakeUpView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.wakeUpView.isHidden = true
            }
        }
    }
}
