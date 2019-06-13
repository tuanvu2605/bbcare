//
//  Utilities.swift
//  AMNOBase
//
//  Created by tuananh on 1/27/19.
//  Copyright © 2019 tuananh. All rights reserved.
//

import UIKit
import DeviceKit
import SwiftyUserDefaults

class Utilities: NSObject {
    
    class func topSpace()->CGFloat
    {
        if #available(iOS 11.0,  *) {
            return (UIApplication.shared.delegate?.window??.safeAreaInsets.top)!
        }else
        {
            return 0.0
        }
    }
    
    class func bottomSpace()->CGFloat
    {
        if #available(iOS 11.0,  *) {
            return (UIApplication.shared.delegate?.window??.safeAreaInsets.bottom)!
        }else
        {
            return 0.0
        }
    }
    
    class func headerTopSpace() -> CGFloat{
        return Utilities.isXDeviceFamily() ? 0 : 20
    }
    
    
     class func isXDeviceFamily()->Bool {
        let device = Device.current
        return device.isOneOf(Device.allXSeriesDevices)
    }

}
struct Size{
    
     struct screen {
        static let width = UIScreen.main.bounds.width
        static let height = UIScreen.main.bounds.height
    }
    
}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

extension DefaultsKeys {
    static let userId = DefaultsKey<String>("userId",defaultValue: "")
    static let babyId = DefaultsKey<String>("babyId",defaultValue: "")
    static let lastWeight = DefaultsKey<Double>("lastWeight",defaultValue: 0.0)
    static let lastHeight = DefaultsKey<Double>("lastHeight",defaultValue: 0.0)
    static let babyName = DefaultsKey<String>("babyName",defaultValue: "")
    static let babyBirthDay = DefaultsKey<String>("babyBirthDay",defaultValue: "")
    static let isExpert = DefaultsKey<Bool>("isExpert",defaultValue: false)
    
}
extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
extension String
{
    func toDate(dateFormat format  : String )->Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }

    func toDouble()->Double{
        if let value = self as? String {
            if let n = NumberFormatter().number(from: value) {
                let f = n.doubleValue
                return f
            }else{
                return 0.0
            }
        }else{
            return 0.0
        }
    }
}
