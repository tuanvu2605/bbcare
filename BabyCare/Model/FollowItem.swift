//
//  FollowItem.swift
//  BabyCare
//
//  Created by tuananhi on 5/24/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class FollowItem: NSObject {
    
    var time = ""
    var height = ""
    var weight = ""
    var url = ""
    var img : UIImage!
    
    init(time : String , height : String , weight : String , url : String , img  : UIImage) {
        self.time = time
        self.height = height
        self.weight = weight
        self.url = url
        self.img = img
    }

}
