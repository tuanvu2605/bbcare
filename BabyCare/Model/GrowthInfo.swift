//
//  GrowthInfo.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class GrowthInfo: NSObject {
    var uid = ""
    var weight : Double = 0.0
    var height : Double = 0.0
    var babyId = ""
    var date = ""
    var notices = [Notice]()
    
    init(dict : [String : Any]) {
        if let _id = dict["_id"] as? String {
            self.uid = _id
        }
        if let _weight = dict["weight"] as? Double {
            self.weight = _weight
        }
        if let _height = dict["height"] as? Double {
            self.height = _height
        }
        if let _date = dict["date"] as? String {
            self.date = _date
        }
        if let _notices = dict["notices"] as? [[String:Any]] {
            for n in _notices {
                let notice = Notice(dict: n)
                self.notices.append(notice)
            }
        }
    }
    
}
