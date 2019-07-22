//
//  TableViewController.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/21/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var taskList = TaskList(listOfTasks: [Task(name: "Physics HW", time: "9AM", category: .academic),
        Task(name: "Robotics club", time: "9pm", category: .social),
        Task(name: "Dentist", time: "4pm", category: .health)])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.listOfTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = taskTableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskListTableViewCell
        cell.taskName.text = tempTask.listOfTasks[indexPath.row].name
        //cell.taskName.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .always
        // Do any additional setup after loading the view.
    }
    


}
