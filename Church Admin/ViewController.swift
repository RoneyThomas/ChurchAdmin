//
//  ViewController.swift
//  Church Admin
//
//  Created by Roney Thomas on 2017-03-18.
//  Copyright © 2017 St. Mary's Malankara Orthodox Syrian Church. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    lazy var ref: FIRDatabaseReference = FIRDatabase.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancelToScheduleTableViewController(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func saveSchedule(segue:UIStoryboardSegue){
        
    }

}

