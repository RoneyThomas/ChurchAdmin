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

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var schedule = [Schedule]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let ref: FIRDatabaseReference = FIRDatabase.database().reference()
        ref.child("schedule").observeSingleEvent(of: .value, with: { (snapshot) in
            // Checking if snapshot is null
            guard snapshot.exists() else {
                print("Snapshot is null")
                return
            }
            // If not then serialize to Schedule class
            for child in snapshot.children{
                self.schedule.append(Schedule(snap: child as! FIRDataSnapshot))
                print(self.schedule.last?.title as Any)
            }
            self.tableView.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if schedule.isEmpty {
            return 0
        } else {
            return schedule.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return (schedule[section].events?.count)!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if schedule.isEmpty {
            print("Its zero")
            return ""
        } else {
            return schedule[section].title
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        cell.textLabel?.text = (schedule[indexPath.section].times?[indexPath.row])! + " : " + (schedule[indexPath.section].events?[indexPath.row])!
        return cell
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

