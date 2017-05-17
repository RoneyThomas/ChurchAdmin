//
//  ViewController.swift
//  Church Admin
//
//  Created by Roney Thomas on 2017-03-18.
//  Copyright © 2017 St. Mary's Malankara Orthodox Syrian Church. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var scheduleLab = ScheduleLab()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        scheduleLab.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if scheduleLab.schedule.isEmpty {
            return 0
        } else {
            return scheduleLab.schedule.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection \(section)")
        return (scheduleLab.schedule[section].events?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("titleForHeaderInSection \(section)")
        if scheduleLab.schedule.isEmpty {
            print("Its zero")
            return ""
        } else {
            return scheduleLab.schedule[section].title
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        cell.textLabel?.text = (scheduleLab.schedule[indexPath.section].times?[indexPath.row])! + " : " + (scheduleLab.schedule[indexPath.section].events?[indexPath.row])!
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // Delete everything individually so that the indexes are build automatically.
            scheduleLab.removeEventTime(index: indexPath)
            // handle delete (by removing the data from your array and updating the tableview)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            // If the events or times are empty then delete the entire child
            if ((scheduleLab.schedule[indexPath.section].events?.isEmpty)! || (scheduleLab.schedule[indexPath.section].times?.isEmpty)!) {
                scheduleLab.delete(index: indexPath)
                tableView.beginUpdates()
                tableView.deleteSections([indexPath.section], with: .fade)
                tableView.endUpdates()
            }
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegueWithIdentifier("WebSegue", sender: indexPath)
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }
    
    

    @IBAction func cancelToScheduleTableViewController(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func saveSchedule(segue:UIStoryboardSegue){
        
    }

}

extension ScheduleViewController: newDataDelegate {
    func reloadTable(){
        self.tableView.reloadData()
    }
}

