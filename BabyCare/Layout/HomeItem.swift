//
//  HomeItem.swift
//  BabyCare
//
//  Created by tuananhi on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit

class HomeItem: InsetLayout<UIView> {
    init(img : UIImage , title: String , description : String) {
        let img = SizeLayout<UIImageView>(width: 80, height: 80, alignment: .centerLeading) { (imgView) in
            imgView.image = img
        }
        
        let title = LabelLayout(text: title, font: AppFont.style.bold(size: 18)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_title()!
        }
        
        let des = LabelLayout(text: description, font: AppFont.style.regular(size: 14)!, numberOfLines: 0, alignment: .centerLeading) { (label) in
            label.textColor = R.color.article_body()!
        }
        
        

        let textStack = StackLayout(axis: .vertical,spacing: 2, sublayouts: [title,des])
        
        let hozStack = StackLayout(axis: .horizontal,spacing: 8, sublayouts: [img,textStack])
        super.init(insets: EdgeInsets(top: 16, left: 16, bottom: 5, right: 16), sublayout: hozStack , config : {view in
            view.backgroundColor = .white
            view.layer.cornerRadius = 10.0
            view.dropShadow()
            
        })
    }
}
