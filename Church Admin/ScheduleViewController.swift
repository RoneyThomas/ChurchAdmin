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
                let schedule = Schedule(snap: child as! FIRDataSnapshot)
                print(schedule.title!)
            }
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return 2
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!
        cell.textLabel?.text = "Roney Thomas"
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

