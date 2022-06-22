//
//  EditViewController.swift
//  SleepApp
//
//  Created by Алексей Горбунов on 27.03.2022.
//

import UIKit

class EditViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var sleepDurationDatePicker: UIDatePicker!
    @IBOutlet weak var wakeupTimeDatePicker: UIDatePicker!
    
    // MARK: - Properties
    weak var delegate: ProfileViewControllerDelegate?
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Private Functions
    private func configure() {
        sleepDurationDatePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        wakeupTimeDatePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        sleepDurationDatePicker.setValue(UIColor(named: "iceGreen"), forKey: "textColor")
        wakeupTimeDatePicker.setValue(UIColor(named: "iceGreen"), forKey: "textColor")
    }
    
    private func parseTimetoString(timePicker: UIDatePicker, flag: Bool) -> String {
        var timeText: String
        let currentDate = timePicker.date
        let formatter = DateFormatter()
        
        if flag {
            formatter.dateFormat = "H:m"
            timeText = formatter.string(from: currentDate)
            let str = timeText.components(separatedBy: ":")
            if str[1] != "0" {
                timeText = "\(str[0])h \(str[1])m"
            } else {
                timeText = "\(str[0])h"
            }
        } else {
            formatter.dateFormat = "H:mm"
            timeText = formatter.string(from: currentDate)
        }
        
        return timeText
    }
    
    // MARK: - objc func
    @objc func dateChanged() {
        let sleepDurationTime = parseTimetoString(timePicker: sleepDurationDatePicker, flag: true)
        let wakeupTime = parseTimetoString(timePicker: wakeupTimeDatePicker, flag: false)
        
        delegate?.saveTime(time: sleepDurationTime, flag: true)
        delegate?.saveTime(time: wakeupTime, flag: false)
    }
}

// MARK: - Protocol Profile View Controller Delegate
protocol ProfileViewControllerDelegate: AnyObject {
    func saveTime(time: String, flag: Bool)
}
