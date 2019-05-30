//
//  GrowthDataEntry.swift
//  BabyCare
//
//  Created by tuananhi on 5/30/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import Charts
import DateToolsSwift

class GrowthDataEntry: ChartDataEntry {
    var notices = [Notice]()
    required init() {
        fatalError("init() has not been implemented")
    }

    
    init(growthInfo : GrowthInfo , type : ChartType) {
        super.init()
        self.x = Double(growthInfo.date.toDate(dateFormat:"dd/MM/yyyy")!.month)
        self.y = type == .weight ? growthInfo.weight : growthInfo.height
        self.notices = growthInfo.notices
    }
    
    
}
