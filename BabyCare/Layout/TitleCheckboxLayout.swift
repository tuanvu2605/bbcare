//
//  TitleCheckboxLayout.swift
//  BabyCare
//
//  Created by tuananhi on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit

class TitleCheckboxLayout: InsetLayout<TitleCheckboxView> {
    
    static let btnTag = 1
    
    
    init(title: String , note : String?) {
        let btn = ButtonLayout(type: .custom, title: "", image: .image(R.image.ic_unchecked()), contentEdgeInsets: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5), alignment: .fill) { (btn) in
            btn.tag = TitleCheckboxLayout.btnTag
            
        }
        let btnLayout = SizeLayout(size: CGSize(width: 35, height: 35), alignment: .topTrailing,  sublayout: btn) { (v) in
            
        }
        
        let title = LabelLayout(text: title, font: AppFont.style.regular(size: 16)!, numberOfLines: 0, alignment: .centerLeading) { (lbl) in
            lbl.textColor = R.color.article_title()!
            
        }
   
        
        let hozStack = StackLayout(axis: .horizontal,spacing: 16, sublayouts: [title , btnLayout])
        var contentStack : StackLayout<UIView>?
        if let _note = note {
            let note = LabelLayout(text: _note, font: AppFont.style.regular(size: 14)!, numberOfLines: 0, alignment: .centerLeading) { (lbl) in
                lbl.textColor = R.color.article_body()!
                
            }
            contentStack = StackLayout(axis: .vertical, spacing: 5, sublayouts: [hozStack,note], config: { (view) in
                
            })
        }
        super.init(insets: EdgeInsets(top: 5, left: 16, bottom: 5, right: 16), sublayout: contentStack ?? hozStack , config : {view in
            view.backgroundColor = .white
            view.addBottomBorderWithColor(color: .lightGray, width: 0.5)
        })
    }

}
