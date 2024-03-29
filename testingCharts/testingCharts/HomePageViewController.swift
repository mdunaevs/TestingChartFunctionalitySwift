//
//  ViewController.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/16/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit
import Charts



class HomePageViewController: UIViewController {

    @IBOutlet weak var pieView: PieChartView!
    
    var taskList = TaskList(listOfTasks: [])
    
    func buildTaskList(){
        // Set the file path
        let path = Bundle.main.path(forResource: "taskData", ofType: "txt")
        let filemanager = FileManager.default
        
        if filemanager.fileExists(atPath: path!) {
            do{
                let fullText = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                let readings = fullText.components(separatedBy: "\n") as [String]
                
                for i in 0..<readings.count{
                    if(readings[i] == ""){
                        continue
                    }
                    var taskArray = readings[i].components(separatedBy: "\t")
                    print(taskArray)
                    let taskName = taskArray[0]
                    let taskTime = taskArray[1]
                    let taskCategory = taskArray[2]
                    //let taskCategory = autoCat(taskName)
                    var task: Task
                    if(taskCategory == "academic"){
                        task = Task(name: taskName, time: taskTime, category: .academic)
                    } else if(taskCategory == "social"){
                        task = Task(name: taskName, time: taskTime, category: .social)
                    } else if(taskCategory == "health"){
                        task = Task(name: taskName, time: taskTime, category: .health)
                    } else if(taskCategory == "events"){
                        task = Task(name: taskName, time: taskTime, category: .events)
                    } else {
                        task = Task(name: taskName, time: taskTime, category: .other)
                    }
                    taskList.addTask(task: task)
                }
            } catch let error as NSError{
                print("Error: \(error)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buildTaskList()

        setupPieChart()
    }
    
    func calculateCategoryValues() -> [CategoryType:Double]{
        /*var total: Double = Double(taskList.li.count)
        var categoryCount: [CategoryType: Int] = [.academic:0, .social: 0, .health: 0, .events: 0, .other: 0]
        for index in 0..<taskList.count{
            var cat = taskList[index].category
            categoryCount[cat] = categoryCount[cat]! + 1
        }
        //print(categoryCount)*/
        let total: Double = Double(taskList.listOfTasks.count)
        /*var academicValue = Double(categoryCount[.academic]! * 100) / total
        var socialValue = Double(categoryCount[.social]! * 100) / total
        var healthValue = Double(categoryCount[.health]! * 100) / total
        var eventsValue = Double(categoryCount[.events]! * 100) / total
        var otherValue = Double(categoryCount[.other]! * 100) / total*/
        
        let academicValue = Double(taskList.amtOfAcademicTasks * 100) / total
        let socialValue = Double(taskList.amtOfSocialTasks * 100) / total
        let healthValue = Double(taskList.amtOfHealthTasks * 100) / total
        let eventsValue = Double(taskList.amtOfEventsTasks * 100) / total
        let otherValue = Double(taskList.amtOfOtherTasks * 100) / total
        let ans: [CategoryType: Double] = [.academic: academicValue, .social: socialValue, .health: healthValue, .events: eventsValue, .other: otherValue]
        //print(ans)
        return ans
    }
    
    func setupPieChart(){
        // No title for the pie chart
        pieView.chartDescription?.enabled = false
        // No hole in the center. You can change size of hole
        pieView.drawHoleEnabled = true
        pieView.holeRadiusPercent = 0.35
        pieView.legend.enabled = false
        pieView.animate(xAxisDuration: 2)
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
        
        if(categoryValues[.academic]! < 7.0 || categoryValues[.social]! < 7.0 || categoryValues[.health]! < 7.0 || categoryValues[.events]! < 7.0 || categoryValues[.other]! < 7.0){
            pieView.legend.enabled = true
            pieView.drawEntryLabelsEnabled = false
        }
        pieView.data = PieChartData(dataSet: dataSet)
    }

    
    @IBAction func addTaskPrompter(_ sender: Any) {
        let tempTask = Task(name: "Math club", time: "8pm-9pm", category: .social)
        self.taskList.addTask(task: tempTask)
        print("New task has been added")
        setupPieChart()
    }
    
}

