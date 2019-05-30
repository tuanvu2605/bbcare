//
//  FollowItemLayout.swift
//  BabyCare
//
//  Created by tuananhi on 5/24/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit

class FollowItemLayout: InsetLayout<UIView> {
    init(followItem : FollowItem) {
        let img = SizeLayout<UIImageView>(width: 145, height: 145, alignment: .centerLeading) { (imgView) in
            imgView.image = followItem.img
            imgView.layer.masksToBounds = true
        }
        
        let timeTitle = LabelLayout(text: "Tuổi", font: AppFont.style.medium(size: 18)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_title()!
        }
        
        let timeDes = LabelLayout(text: followItem.time , font: AppFont.style.regular(size: 14)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_body()!
        }
        let timeStack = StackLayout(axis: .vertical,spacing: 2, sublayouts: [timeTitle,timeDes])
        
        let wTitle = LabelLayout(text: "Cân nặng", font: AppFont.style.medium(size: 18)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_title()!
        }
        
        let wDes = LabelLayout(text: followItem.weight , font: AppFont.style.regular(size: 14)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_body()!
        }
        let wStack = StackLayout(axis: .vertical,spacing: 2, sublayouts: [wTitle,wDes])
        
        let hTitle = LabelLayout(text: "Chiều cao", font: AppFont.style.medium(size: 18)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_title()!
        }
        
        let hDes = LabelLayout(text: followItem.height , font: AppFont.style.regular(size: 14)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_body()!
        }
        let hStack = StackLayout(axis: .vertical,spacing: 2, sublayouts: [hTitle,hDes])
        let contentStack = StackLayout(axis: .vertical,spacing: 8, sublayouts: [timeStack,hStack,wStack])
        
        let hozStack = StackLayout(axis: .horizontal,spacing: 16, sublayouts: [img,contentStack])
        super.init(insets: EdgeInsets(top: 16, left: 16, bottom: 5, right: 16), sublayout: hozStack , config : {view in
            view.backgroundColor = .white
            
        })
    }
}
