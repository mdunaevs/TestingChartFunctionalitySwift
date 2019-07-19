//
//  TaskListTableViewCell.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/19/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {

    @IBOutlet weak var taskImage: UIButton!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskFinishedBtn: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
