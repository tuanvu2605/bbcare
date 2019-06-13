//
//  Baby.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class Baby: NSObject {
    var id = ""
    var gender : Int = 0
    var name = ""
    var birthday = ""
    var birthplace = ""
    var weekWhenBorn : Int = 0
    var bornWeight : Double = 0.0
    var bornHeight : Double = 0.0
    
    
    init (dict : [String : Any]){
        if let _id = dict["_id"] as? String {
            self.id = _id
            Defaults[.babyId] = _id
        }
        if let _gender = dict["gender"] as? Int {
            self.gender = _gender
        }
        if let _name = dict["name"] as? String {
            self.name = _name
            AppModel.shared.babyName = name
            Defaults[.babyName] = _name
        }
        if let _birthday = dict["birthDay"] as? String {
            self.birthday = _birthday
            Defaults[.babyBirthDay] = _birthday
           
        }
        if let _bornWeight = dict["bornWeight"] as? Double{
            self.bornWeight = _bornWeight
            AppModel.shared.weight = _bornWeight
        }
        if let _bornHeight = dict["bornHeight"] as? Double{
            self.bornHeight = _bornHeight
            AppModel.shared.height = _bornHeight
        }
        
    }
    
    
    
    

}
