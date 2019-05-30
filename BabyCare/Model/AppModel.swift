//
//  AppModel.swift
//  BabyCare
//
//  Created by tuananhi on 5/25/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class AppModel: NSObject {
    static let shared = AppModel()
    var user : User?
    var babyId = ""
    var weight : Double = 0.0
    var height : Double = 0.0
}
