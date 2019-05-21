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
    var thumbnail = ""
    
    
    init (dict : [String : Any]){
        if let _id = dict["_id"] as? String {
            self.uid = _id
        }
        if let _title = dict["title"] as? String {
            self.title = _title
        }
        if let _des = dict["description"] as? String {
            self._description = _des
        }
        if let _url = dict["url"] as? String {
            self.url = _url
        }
        if let _wId = dict["user"] as? String{
            self.writerId = _wId
        }
        if let _thumb = dict["thumbnail"] as? String{
            self.thumbnail = _thumb
        }
        
    }
    

}
