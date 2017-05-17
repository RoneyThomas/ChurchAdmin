//
//  ScheduleLab.swift
//  Church Admin
//
//  Created by Roney Thomas on 2017-05-17.
//  Copyright © 2017 St. Mary's Malankara Orthodox Syrian Church. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class ScheduleLab {
    
    var schedule = [Schedule]()
    var keys = [String]()
    var ref: DatabaseReference
    var delegate: newDataDelegate?
    
    init(){
        ref = Database.database().reference()
        ref.child("schedule").observeSingleEvent(of: .value, with: { (snapshot) in
            // Checking if snapshot is null
            guard snapshot.exists() else {
                print("Snapshot is null")
                return
            }
            // Serialize snapshot to Schedule class
            for child in snapshot.children{
                self.schedule.append(Schedule(snap: child as! DataSnapshot))
                print(self.schedule.last?.title as Any)
                // Save keys. This is used later for deleting a child
                self.keys.append((child as! DataSnapshot).key)
            }
            self.delegate?.reloadTable()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func delete(index: IndexPath){
        schedule.remove(at: index.section)
        ref.child("schedule/\(keys[index.section])").removeValue()
    }
    
    func removeEventTime(index: IndexPath){
        schedule[index.section].events?.remove(at: index.row)
        schedule[index.section].times?.remove(at: index.row)
        ref.child("schedule/\(keys[index.section])/events").setValue(schedule[index.section].events)
        ref.child("schedule/\(keys[index.section])/times").setValue(schedule[index.section].times)
    }
}
