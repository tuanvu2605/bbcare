//
//  Utilities.swift
//  AMNOBase
//
//  Created by tuananh on 1/27/19.
//  Copyright © 2019 tuananh. All rights reserved.
//

import UIKit
import DeviceKit

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

