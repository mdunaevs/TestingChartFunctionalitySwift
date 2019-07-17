//
//  Task.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/16/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import Foundation

enum CategoryType{
    case academic
    case social
    case health
    case events
    case other
}

struct Task{
    
    var name: String
    var time: String
    var category: CategoryType
    var pinned: Bool
    
    init(name: String, time: String, category: CategoryType, pinned: Bool = false){
        self.name = name
        self.time = time
        self.category = category
        self.pinned = pinned
    }
    
    
}


