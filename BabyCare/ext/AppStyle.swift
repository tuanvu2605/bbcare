//
//  EPStyle.swift
//  Epay
//
//  Created by tuananh on 3/15/19.
//  Copyright © 2019 tuananh. All rights reserved.
//

import UIKit

class AppStyle: NSObject {

}

struct AppFont {
    struct style
    {
        
        static func medium(size : CGFloat)->UIFont?{
            return R.font.sfProTextMedium(size: size)
        }
        static func regular(size : CGFloat)->UIFont?{
            return R.font.sfProTextRegular(size: size)
        }
        static func semibold(size : CGFloat)->UIFont?{
            return R.font.sfProTextMedium(size: size)
        }
        static func bold(size : CGFloat)->UIFont?{
            return R.font.sfProTextBold(size: size)
        }
    }
}
