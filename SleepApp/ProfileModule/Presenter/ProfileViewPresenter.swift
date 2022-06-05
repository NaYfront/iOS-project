//
//  ProfilePresenter.swift
//  SleepApp
//
//  Created by NaYfront on 05.04.2022.
//

import Foundation
import UIKit
import Charts
import CoreData

protocol ProfileViewPresenterProtocol: AnyObject {
    init(profileView: ProfileViewProtocol, coreDataHandler: CoreDataHandler)
    func createGraphBarChart(inFrame frame: CGRect, forDataSource dataSource: GraphDataSource, withIdentifier identifier: String) -> BarChartView
    func setGraphs()
    func changeUserPreferableSleepTime(newValue: Date)

}

class ProfileViewPresenter: ProfileViewPresenterProtocol {
    
    // MARK: Variables
    
    let profileView: ProfileViewProtocol
    
    let coreDataHandler: CoreDataHandler
    
    var lineCharts = [LineChartView]()
    
    var barCharts = [BarChartView]()
    
    var sleepTimeView: UIView?
    
    var wakeTimeView: UIView?
    
    var sleepDurationView: UIView?
    
    // MARK: Initializations
    
    required init(profileView: ProfileViewProtocol, coreDataHandler: CoreDataHandler) {
        self.profileView = profileView
        self.coreDataHandler = coreDataHandler
    }
    
    // MARK: Functions
    
    func changeUserPreferableSleepTime(newValue: Date) {
        let newTime = Time(date: newValue)
        coreDataHandler.changeUserPreferableSleepTime(newSleepTime: newTime)
        
        NotificationHandler.setNotification(withTitle: "Good Night :)", withBody: "It's time to sleep. See you tomorrow!", withTime: newTime, withIdentifier: NotificationIdentifiers.sleepTime, isRepeating: true)
    }
    
    func updateGraphs() {
        for barChart in barCharts {
            profileView.removeChartGraph(barChartGraph: barChart)
        }
        barCharts = [BarChartView]()
        for lineChart in lineCharts {
            profileView.removeChartGraph(lineChartGraph: lineChart)
        }
        lineCharts = [LineChartView]()
        
        setGraphs()
    }
    
    func setGraphs() {
        sleepTimeView = profileView.getSleepTimeView()
        wakeTimeView = profileView.getWakeTimeView()
        sleepDurationView = profileView.getSleepDurationView()
        
        let sleepTimeLineChart = createGraphLineChart(inFrame: CGRect(x: 0, y: 0, width: sleepTimeView!.frame.width - 25, height: sleepTimeView!.frame.height - 25), forDataSource: GraphDataSource(dataSource: coreDataHandler.getAllObjects(objectName: Entities.SleepTime)!, withIdentifier: "SleepTimeGraph"), withIdentifier: "SleepTimeGraph")
        
        let wakeTimeLineChart = createGraphLineChart(inFrame: CGRect(x: 0, y: 0, width: wakeTimeView!.frame.width - 25, height: wakeTimeView!.frame.height - 25), forDataSource: GraphDataSource(dataSource: coreDataHandler.getAllObjects(objectName: Entities.WakeTime)!, withIdentifier: "WakeTimeGraph"), withIdentifier: "WakeTimeGraph")
        
        let sleepDurationTimeBarChart = createGraphBarChart(inFrame: CGRect(x: 0, y: 0, width: sleepDurationView!.frame.width - 25, height: sleepDurationView!.frame.height - 25), forDataSource: GraphDataSource(dataSource: coreDataHandler.getAllObjects(objectName: Entities.SleepDurationTime)!, withIdentifier: "SleepDurationTimeGraph"), withIdentifier: "SleepDurationTimeGraph")
        
        barCharts.append(sleepDurationTimeBarChart)
        lineCharts.append(sleepTimeLineChart)
        lineCharts.append(wakeTimeLineChart)
        
        profileView.showChartGraph(inView: sleepTimeView!, lineChartGraph: sleepTimeLineChart)
        profileView.showChartGraph(inView: wakeTimeView!, lineChartGraph: wakeTimeLineChart)
        profileView.showChartGraph(inView: sleepDurationView!, barChartGraph: sleepDurationTimeBarChart)
    }
    
    func createGraphLineChart(inFrame frame: CGRect, forDataSource dataSource: GraphDataSource, withIdentifier identifier: String) -> LineChartView {
        let lineChart = LineChartView(frame: frame)
        
        var entries = [ChartDataEntry]()
        
        var xLabels = [String]()
        
        for i in 0..<dataSource.numberOfPoints() {
            entries.append(ChartDataEntry(x: Double(i), y: dataSource.value(forIdentifier: identifier, atIndex: i)))
            xLabels.append(dataSource.label(atIndex: i))
        }
        
        let set = LineChartDataSet(entries: entries, label: "")
        
        set.circleRadius = 4.1
        set.drawCircleHoleEnabled = false
        set.lineWidth = 3
        set.drawFilledEnabled = true
        set.mode = .cubicBezier
        set.drawValuesEnabled = false

        let data = LineChartData(dataSet: set)
        
        lineChart.data = data
        lineChart.dragEnabled = false
        lineChart.doubleTapToZoomEnabled = false
        lineChart.drawGridBackgroundEnabled = false
        lineChart.xAxis.drawGridLinesEnabled = false
        lineChart.xAxis.labelPosition = .bottom
        lineChart.leftAxis.drawGridLinesEnabled = true
        lineChart.leftAxis.drawAxisLineEnabled = false
        lineChart.rightAxis.drawGridLinesEnabled = false
        lineChart.rightAxis.drawLabelsEnabled = false
        lineChart.rightAxis.drawAxisLineEnabled = false
        lineChart.legend.enabled = false
        lineChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: xLabels)
        lineChart.leftAxis.valueFormatter = IndexAxisValueFormatter(values: [ "00:00" , "01:00" , "02:00" , "03:00" , "04:00" , "05:00" , "06:00" , "07:00" , "08:00" , "09:00" , "10:00" , "11:00" , "12:00" , "13:00" , "14:00" , "15:00" , "16:00" , "17:00" , "18:00" , "19:00" , "20:00" , "21:00" , "22:00" , "23:00" , "24:00" ])
        
        lineChart.xAxis.labelFont = UIFont(name: "Helvetica Neue", size: 8.5)!
        lineChart.xAxis.granularity = 1
        
        lineChart.isUserInteractionEnabled = false
        
        return lineChart
    }
    
    func createGraphBarChart(inFrame frame: CGRect, forDataSource dataSource: GraphDataSource, withIdentifier identifier: String) -> BarChartView {
        let barChart = BarChartView(frame: frame)
        
        var entries = [BarChartDataEntry]()
        var xLabels = [String]()
        
        for i in 0..<dataSource.numberOfPoints() {
            entries.append(BarChartDataEntry(x: Double(i), y: dataSource.value(forIdentifier: identifier, atIndex: i)))
            xLabels.append(dataSource.label(atIndex: i))
        }
        
        let set = BarChartDataSet(entries: entries, label: identifier)
        set.drawValuesEnabled = false
        
        let data = BarChartData(dataSet: set)
        
        barChart.data = data
        barChart.dragEnabled = false
        barChart.doubleTapToZoomEnabled = false
        barChart.drawGridBackgroundEnabled = false
        barChart.xAxis.drawGridLinesEnabled = false
        barChart.xAxis.labelPosition = .bottom
        barChart.leftAxis.drawGridLinesEnabled = true
        barChart.leftAxis.drawAxisLineEnabled = false
        barChart.rightAxis.drawGridLinesEnabled = false
        barChart.rightAxis.drawLabelsEnabled = false
        barChart.rightAxis.drawAxisLineEnabled = false
        barChart.legend.enabled = false
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: xLabels)
        barChart.leftAxis.valueFormatter = IndexAxisValueFormatter(values: ["00:00" , "01:00" , "02:00" , "03:00" , "04:00" , "05:00" , "06:00" , "07:00" , "08:00" , "09:00" , "10:00" , "11:00" , "12:00" , "13:00" , "14:00" , "15:00" , "16:00" , "17:00" , "18:00" , "19:00" , "20:00" , "21:00" , "22:00" , "23:00" , "24:00"])
        
        barChart.xAxis.labelFont = UIFont(name: "Helvetica Neue", size: 8.5)!
        barChart.xAxis.granularity = 1
        
        return barChart
    }
}
