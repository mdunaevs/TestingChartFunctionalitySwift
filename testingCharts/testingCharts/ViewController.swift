//
//  ViewController.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/16/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var pieView: PieChartView!
    
    var taskList: [Task] = Array()
    
    func buildTaskList(){
        var task1 = Task(name: "Physics HW", time: "9am - 11am", category: .academic)
        var task2 = Task(name: "Physics Lecture", time: "9am - 11am", category: .academic)
        var task3 = Task(name: "Math HW", time: "9am - 11am", category: .academic)
        var task4 = Task(name: "DFA meeting", time: "9am - 11am", category: .social)
        var task5 = Task(name: "Dentist appointment", time: "9am - 11am", category: .health)
        var task6 = Task(name: "Robotics meeting", time: "9am - 11am", category: .social)
        var task7 = Task(name: "Math OH", time: "9am - 11am", category: .events)
        var task8 = Task(name: "Computer Science HW", time: "9am - 11am", category: .academic)
        var task9 = Task(name: "CS OH", time: "9am - 11am", category: .events)
        var task10 = Task(name: "Laundry", time: "9am - 11am", category: .other)
        
        taskList.append(task1)
        taskList.append(task2)
        taskList.append(task3)
        taskList.append(task4)
        taskList.append(task5)
        taskList.append(task6)
        taskList.append(task7)
        taskList.append(task8)
        taskList.append(task9)
        taskList.append(task10)
        
    }

    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildTaskList()
        //print(taskList)
        setupPieChart()
    }
    
    func calculateCategoryValues() -> [CategoryType:Double]{
        var total: Double = Double(taskList.count)
        var categoryCount: [CategoryType: Int] = [.academic:0, .social: 0, .health: 0, .events: 0, .other: 0]
        for index in 0..<taskList.count{
            var cat = taskList[index].category
            categoryCount[cat] = categoryCount[cat]! + 1
        }
        //print(categoryCount)
        var academicValue = Double(categoryCount[.academic]! * 100) / total
        var socialValue = Double(categoryCount[.social]! * 100) / total
        var healthValue = Double(categoryCount[.health]! * 100) / total
        var eventsValue = Double(categoryCount[.events]! * 100) / total
        var otherValue = Double(categoryCount[.other]! * 100) / total
        var ans: [CategoryType: Double] = [.academic: academicValue, .social: socialValue, .health: healthValue, .events: eventsValue, .other: otherValue]
        //print(ans)
        return ans
    }
    
    func setupPieChart(){
        // No title for the pie chart
        pieView.chartDescription?.enabled = false
        // No hole in the center. You can change size of hole
        pieView.drawHoleEnabled = true
        pieView.holeRadiusPercent = 0.35
        //pieView.legend.enabled = false
        pieView.animate(xAxisDuration: 3)
        pieView.rotationAngle = 0
        pieView.rotationEnabled = true
        pieView.isUserInteractionEnabled = true
        
        var entries: [PieChartDataEntry] = Array()
        var categoryValues = calculateCategoryValues()
        entries.append(PieChartDataEntry(value: categoryValues[.academic]!, label: "Academic"))
        entries.append(PieChartDataEntry(value: categoryValues[.social]!, label: "Social"))
        entries.append(PieChartDataEntry(value: categoryValues[.health]!, label: "Health"))
        entries.append(PieChartDataEntry(value: categoryValues[.events]!, label: "Events"))
        entries.append(PieChartDataEntry(value: categoryValues[.other]!, label: "Other"))
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        let colors = [UIColor(named: "academicColor"), UIColor(named:"socialColor"), UIColor(named: "healthColor"), UIColor(named: "eventsColor"), UIColor(named: "otherColor")]
        dataSet.colors = colors as! [NSUIColor]
        dataSet.drawValuesEnabled = false
        
        pieView.data = PieChartData(dataSet: dataSet)
    }


}

