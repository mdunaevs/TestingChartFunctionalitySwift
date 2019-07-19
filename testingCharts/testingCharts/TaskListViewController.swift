//
//  TaskListViewController.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/19/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var tempTask = TaskList(listOfTasks: [
        Task(name: "Physics HW", time: "9am", category: .academic),
        Task(name: "Doctor appointment", time: "3pm", category: .health),
        Task(name: "Math club meeting", time: "6pm", category: .social)
        ])
    
    @IBOutlet weak var taskTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempTask.listOfTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskListTableViewCell
        cell.taskName.text = tempTask.listOfTasks[indexPath.row].name
        //cell.taskName.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
        
        return cell
    }
    
   /* optional func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
    }*/
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
