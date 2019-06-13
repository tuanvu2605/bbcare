//
//  NutritionTask.swift
//  BabyCare
//
//  Created by tuananhi on 6/3/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class NutritionTask: NSObject {
    var month = 0
    var content = ""
    var note = ""
    init(dict : [String : Any]) {
        
        if let _content = dict["content"] as? String {
            self.content = _content
        }
        if let _note = dict["note"] as? String {
            self.note = _note
        }
        if let _month = dict["month"] as? Int {
            self.month = _month
        }
        
    }

}
