//
//  ItemSettingLayout.swift
//  BabyCare
//
//  Created by tuananhi on 5/19/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit

class ItemSettingLayout: InsetLayout<UIView> {
    
    init(img : UIImage , title: String) {
        let img = SizeLayout<UIImageView>(width: 32, height: 32, alignment: .centerLeading) { (imgView) in
            imgView.image = img
        }
        
        let title = LabelLayout(text: title, font: AppFont.style.medium(size: 16)!, numberOfLines: 0, alignment: .centerLeading) { (lbl) in
        
        }
        
        let hozStack = StackLayout(axis: .horizontal,spacing: 16, sublayouts: [img,title])
        super.init(insets: EdgeInsets(top: 5, left: 16, bottom: 5, right: 16), sublayout: hozStack , config : {view in
            view.backgroundColor = .white
            view.addBottomBorderWithColor(color: .lightGray, width: 0.2)
        })
    }

}
