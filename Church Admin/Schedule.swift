//
//  Schedule.swift
//  Church Admin
//
//  Created by Roney Thomas on 2017-05-12.
//  Copyright © 2017 St. Mary's Malankara Orthodox Syrian Church. All rights reserved.
//

import Foundation
import Firebase

class Schedule {
    var title: String?
    var expiryDate: String?
    var events: [String]?
    var times: [String]?
    
    init(snap: FIRDataSnapshot) {
        
        let snapDict = snap.value as! [String: Any]
        
        self.title = snapDict["title"] as? String
        self.expiryDate = snapDict["expiryDate"] as? String
        self.events = snapDict["events"] as? [String]
        self.times = snapDict["times"] as? [String]
    }
}
