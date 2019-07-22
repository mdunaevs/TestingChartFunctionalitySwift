//
//  HeaderIncludedViewController.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/21/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit

class HeaderIncludedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tempTask = TaskList(listOfTasks: [
        Task(name: "Physics HW", time: "9am", category: .academic),
        Task(name: "Doctor appointment", time: "3pm", category: .health),
        Task(name: "Math club meeting", time: "6pm", category: .social)
        ])
    

    @IBOutlet weak var tasklistTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasklistTable.tableFooterView = UIView(frame: .zero)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempTask.listOfTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasklistTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewHeaderIncludedCell
        cell.backgroundColor = UIColor(named: determineBackgroundColor(task: tempTask.listOfTasks[indexPath.row]))
        
        cell.cellLabel?.text = tempTask.listOfTasks[indexPath.row].name
        
        if let btnFinished = cell.contentView.viewWithTag(102) as? UIButton {
            btnFinished.addTarget(self, action: #selector(deleteRow(_:)), for: .touchUpInside)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }

    
   @objc func deleteRow(_ sender: UIButton){
        let point = sender.convert(CGPoint.zero, to: tasklistTable)
        guard let indexPath = tasklistTable.indexPathForRow(at: point) else {
            return
        }
        tempTask.listOfTasks.remove(at: indexPath.row)
        tasklistTable.deleteRows(at: [indexPath], with: .left)
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
