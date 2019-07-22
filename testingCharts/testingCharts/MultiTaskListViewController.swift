//
//  MultiTaskListViewController.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/19/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit

class MultiTaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var array1 = ["strawberry", "banana", "grape", "orange"]
    var array2 = ["carrot", "broccoli", "celery"]
    
    @IBOutlet weak var pinnedTable: UITableView!
    @IBOutlet weak var taskTable: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == pinnedTable){
            print("Entered pinned table")
            return array1.count
        }else{
            return array2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == pinnedTable){
            print("Entered pinned table")
            let cell = tableView.dequeueReusableCell(withIdentifier: "pinnedCell", for: indexPath) as! TableViewPinnedTaskCell
            cell.pinnedTaskLabel.text = array1[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TableViewDayTaskCell
            cell.dayTaskLabel.text = array2[indexPath.row]
            return cell
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
