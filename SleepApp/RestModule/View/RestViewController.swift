//
//  RestViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit

protocol RestViewProtocol: AnyObject {
    func showUserStateAnimation(userState: UserStates)
}

class RestViewController: UIViewController {
    
    var restPresenter: RestViewPresenterProtocol!

    @IBOutlet weak var animationBackgroundView: UIView!
    
    @IBOutlet weak var currentStateImageView: UIImageView!
    
    @IBOutlet weak var currentStateLabel: UILabel!
    
    @IBAction func changeUserStatusButtonAction(_ sender: Any) {
        self.restPresenter.changeUserState()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animationBackgroundView.alpha = 0
        self.animationBackgroundView.isHidden = false
    }
}

extension RestViewController: RestViewProtocol {
    func showUserStateAnimation(userState: UserStates) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let currentWindow = windowScene?.windows.first
        currentWindow?.addSubview(self.animationBackgroundView)
 
        userStateAnimate(userState: userState)
    }
    
    func userStateAnimate(userState: UserStates) {
        if userState == UserStates.awake {
            self.currentStateImageView.image = UIImage(systemName: "moon.zzz.fill")
            self.currentStateLabel.text = "Good Night"
        } else {
            self.currentStateImageView.image = UIImage(systemName: "sun.and.horizon.fill")
            self.currentStateLabel.text = "Good Morning"
        }
        
        
        UIView.animate(withDuration: 0.1) {
            self.animationBackgroundView.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 1.5) {
                self.currentStateImageView.alpha = 1
                self.currentStateLabel.alpha = 1
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
}
