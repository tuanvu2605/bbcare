//
//  User.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class User: NSObject {
    var uid = ""
    var name = ""
    var relationship : Int = 0
    var avatarURL = ""
    var email = ""
    var babies = [Baby]()
    override init() {
        super.init()
    }
    
    init(dict : [String : Any]) {
        if let _id = dict["_id"] as? String {
            self.uid = _id
        }
        if let _relationship = dict["relationship"] as? Int {
            self.relationship = _relationship
        }
        if let _name = dict["name"] as? String {
            self.name = _name
        }
        if let _babies = dict["babies"] as? [[String:Any]] {
            for b in _babies {
                let baby = Baby(dict: b)
                self.babies.append(baby)
            }
        }
    }
    

}
