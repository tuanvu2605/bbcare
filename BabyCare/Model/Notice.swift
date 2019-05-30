//
//  Notice.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class Notice: NSObject {
    var uid = ""
    var content = ""
    var type : Int = 0
    init(dict : [String : Any]) {
        if let _content = dict["content"] as? String {
            self.content = _content
        }
        if let _type = dict["_type"] as? Int {
            self.type = _type
        }
    }

}
