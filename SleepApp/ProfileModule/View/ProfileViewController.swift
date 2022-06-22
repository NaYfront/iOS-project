//
//  ProfileViewController.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import UIKit
import Charts

protocol ProfileViewProtocol: AnyObject {
    func presentSettingsViewController()
    func showChartGraph(inView view: UIView, barChartGraph: BarChartView)
    func showChartGraph(inView view: UIView, lineChartGraph: LineChartView)
    func getSleepTimeView() -> UIView
    func getWakeTimeView() -> UIView
    func getSleepDurationView() -> UIView
    func removeChartGraph(barChartGraph: BarChartView)
    func removeChartGraph(lineChartGraph: LineChartView)
}

class ProfileViewController: UIViewController {
    
    // MARK: Presenters
    
    var profileViewPresenter: ProfileViewPresenterProtocol!
    
    // MARK: UI
    
    @IBOutlet weak var sleepTimeLabel: UILabel!
    
    @IBOutlet weak var wakeTimeLabel: UILabel!
    
    @IBOutlet weak var sleepDurationTimeLabel: UILabel!
    
    @IBOutlet weak var preferableSleepTimeLabel: UILabel!
    
    @IBOutlet var settingsViewController: UIViewController!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var sleepTimeView: UIView!
    
    @IBOutlet weak var wakeTimeView: UIView!
    
    @IBOutlet weak var sleepDurationView: UIView!
    
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var timeDatePicker: UIDatePicker!
    
    // MARK: Actions
    
    @IBAction func changeTimeButtonAction(_ sender: Any) {
        let datePickerValue = timeDatePicker.date
       
        sendUserPreferableSleepTimeNewValue(newValue: datePickerValue)
        
        dismiss(animated: true)
    }
    
    @IBAction func settingsButtonAction(_ sender: Any) {
        presentSettingsViewController()
    }
    
    // MARK: ViewController Lificycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileViewPresenter.setGraphs()
        
        contentViewHeightConstraint.constant = sleepDurationView.frame.maxY
        self.scrollView.layoutIfNeeded()
        
        sleepTimeLabel.makeCornerRadius(radius: 20)
        wakeTimeLabel.makeCornerRadius(radius: 20)
        sleepDurationTimeLabel.makeCornerRadius(radius: 20)
        preferableSleepTimeLabel.makeCornerRadius(radius: 20)
    }
}

extension ProfileViewController: ProfileViewProtocol {
    
    // MARK: Protocol Implementation
    
    func sendUserPreferableSleepTimeNewValue(newValue: Date) {
        profileViewPresenter.changeUserPreferableSleepTime(newValue: newValue)
    }
    
    func presentSettingsViewController() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(settingsViewController, animated: false, completion: nil)
    }
    
    func getSleepTimeView() -> UIView {
        return sleepTimeView
    }
    
    func getWakeTimeView() -> UIView {
        return wakeTimeView
    }
    
    func getSleepDurationView() -> UIView {
        return sleepDurationView
    }
    
    func showChartGraph(inView view: UIView, barChartGraph: BarChartView) {
        view.addSubview(barChartGraph)
    }
    
    func showChartGraph(inView view: UIView, lineChartGraph: LineChartView) {
        view.addSubview(lineChartGraph)
    }
    
    func removeChartGraph(barChartGraph: BarChartView) {
        barChartGraph.removeFromSuperview()
    }
    
    func removeChartGraph(lineChartGraph: LineChartView) {
        lineChartGraph.removeFromSuperview()
    }
}
