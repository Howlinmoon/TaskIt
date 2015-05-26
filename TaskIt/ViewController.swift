//
//  ViewController.swift
//  TaskIt
//
//  Created by jim Veneskey on 5/20/15.
//  Copyright (c) 2015 Jim Veneskey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // example of how you could access these connection via code
        // self.tableView.dataSource = self
        // self.tableView.delegate = self
        
        // Create example tasks
        
        let date1 = Date.from(year: 2015, month: 5, day: 25)
        let date2 = Date.from(year: 2015, month: 5, day: 26)
        let date3 = Date.from(year: 2015, month: 5, day: 27)
        
        let task1 = TaskModel(task: "Study German", subTask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subTask: "Burgers", date: date2)

        taskArray = [task1, task2, TaskModel(task: "Gym", subTask: "Leg Day", date: date3)]
        
        // refresh the information in the tableview - which calls both ancillary functions
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called right before new view controller is presented
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC: TaskDetailViewController = segue.destinationViewController as! TaskDetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
        } 
    }

    // UITableViewDataSource (required methods)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println("Row: \(indexPath.row)")
        
        let thisTask = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as! TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subTask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    // UITableViewDelegate required method
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println("You tapped Row: \(indexPath.row), section: \(indexPath.section)")
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
    }

}