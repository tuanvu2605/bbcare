//
//  Blog.swift
//  BabyCare
//
//  Created by tuananhi on 5/19/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class Blog: NSObject {
    
    var uid = ""
    var title = ""
    var _description = ""
    var url = ""
    var writerId = ""
    
    init (dict : [String : Any]){
        if let _id = dict["_id"] as? String {
            self.uid = _id
        }
        if let _title = dict["title"] as? String {
            self.uid = _title
        }
        if let _des = dict["_description"] as? String {
            self._description = _des
        }
        if let _url = dict["url"] as? String {
            self.uid = _url
        }
        
    }
    

}
