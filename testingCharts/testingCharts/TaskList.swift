//
//  TaskList.swift
//  testingCharts
//
//  Created by Max Dunaevschi on 7/18/19.
//  Copyright © 2019 Max Dunaevschi. All rights reserved.
//

import Foundation


struct TaskList{
    
    var listOfTasks: [Task]
    var amtOfAcademicTasks: Int = 0
    var amtOfSocialTasks: Int = 0
    var amtOfHealthTasks: Int = 0
    var amtOfEventsTasks: Int = 0
    var amtOfOtherTasks: Int = 0
    
    
    init(listOfTasks: [Task]){
        self.listOfTasks = listOfTasks
        setupTaskCounts()
    }
    
    // When passed an array with tasks already, this function will properly get the correct amount of counts for each individual task.
    mutating func setupTaskCounts(){
        for index in 0..<self.listOfTasks.count{
            let currTask: Task = self.listOfTasks[index]
            checkCategoryType(task: currTask)
        }
    }
    
    // Checks what category a given task is and uodates count
    mutating func checkCategoryType(task: Task){
        if(task.category == .academic){
            self.amtOfAcademicTasks =  self.amtOfAcademicTasks + 1
        }
        if(task.category == .social){
            self.amtOfSocialTasks += 1
        }
        if(task.category == .health){
            self.amtOfHealthTasks += 1
        }
        if(task.category == .events){
            self.amtOfEventsTasks += 1
        }
        if(task.category == .other){
            self.amtOfOtherTasks += 1
        }
    }
    
    // Adds task of task array and updates category counts
    mutating func addTask(task: Task){
        if(taskAlreadyExists(newTask: task)){
            print("Task already on your list")
        } else {
            self.listOfTasks.append(task)
            checkCategoryType(task: task)
        }

    }
    
    // Returns whether or not a task is already in the list
    func taskAlreadyExists(newTask: Task) -> Bool{
        for index in 0..<self.listOfTasks.count{
            if(newTask.name == self.listOfTasks[index].name && newTask.category == self.listOfTasks[index].category && newTask.time == self.listOfTasks[index].time){
                return true
            }
        }
        return false
    }
    
    // When the user clicks the complete button, the item should be removed from the list
    mutating func removeTask(task: Task){
        for index in (0..<self.listOfTasks.count).reversed(){
            if(task.name == self.listOfTasks[index].name && task.category == self.listOfTasks[index].category && task.time == self.listOfTasks[index].time){
                self.listOfTasks.remove(at: index)
            }
        }
    }
    
    
}
