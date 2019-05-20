//
//  EPBottomButtonLayout.swift
//  Epay
//
//  Created by tuananh on 3/15/19.
//  Copyright © 2019 tuananh. All rights reserved.
//

import UIKit
import LayoutKit

class AppBottomButtonLayout: InsetLayout<UIView> {
    
    static let buttonTag : Int = 1
    public init (bottomButtonTitle :String , sel : Selector ){
        
        let buttonLayout = ButtonLayout(type: .custom, title: bottomButtonTitle, image: .defaultImage, alignment: .fill) { (button) in
            button.setTitleColor(UIColor.white, for: .normal)
          
            button.titleLabel?.font = AppFont.style.medium(size: 15)
            button.addTarget(nil, action: sel, for: .touchUpInside);
            button.setHeight(h: 48.0)
            button.tag = AppBottomButtonLayout.buttonTag
            button.gradientByStyle()
            button.layer.cornerRadius = button.height/2
            button.layer.masksToBounds = true
        }
        
        
        let bottomLayout = SizeLayout(height: Utilities.bottomSpace() + 16.0)
        let stackLayout = StackLayout(axis: .vertical, spacing: 0, sublayouts: [buttonLayout , bottomLayout])
        
        super.init(insets: EdgeInsets(top: 12, left: 12, bottom: 16, right: 12), sublayout: stackLayout , config : {view in
            view.backgroundColor = .white;
        })
        
    }
}
