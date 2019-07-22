//
//  TaskListViewController.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/19/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var tempTask = TaskList(listOfTasks: [
        Task(name: "Physics HW", time: "9am", category: .academic),
        Task(name: "Doctor appointment", time: "3pm", category: .health),
        Task(name: "Math club meeting", time: "6pm", category: .social)
        ])



    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempTask.listOfTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskListTableViewCell
        cell.taskName.text = tempTask.listOfTasks[indexPath.row].name
        cell.backgroundColor = UIColor(named: determineBackgroundColor(task: tempTask.listOfTasks[indexPath.row]))
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func determineBackgroundColor(task: Task) -> String{
        if(task.category == .academic){
            return "academicColor"
        } else if(task.category == .social){
            return "socialColor"
        }else if(task.category == .health){
            return "healthColor"
        }else if(task.category == .events){
            return "eventsColor"
        }
        return "otherColor"
    }
    
   

}
