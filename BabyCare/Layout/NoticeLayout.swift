//
//  NoticeLayout.swift
//  BabyCare
//
//  Created by tuananhi on 5/29/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit


class NoticeView: UIView {
    
}


class NoticeLayout: InsetLayout<NoticeView> {
    
    init(notice : Notice) {
        let img = SizeLayout<UIImageView>(width: 20, height: 20, alignment: .centerLeading) { (imgView) in
            if notice.type == 1 {
                imgView.image = R.image.ic_congrat()
            }else{
                imgView.image = R.image.ic_warning_red()
            }
        }
        var noticeTitle = ""
        if notice.type == 1 {
            noticeTitle = "Chúc mừng"
        }else{
            noticeTitle = "Cảnh bảo"
        }
        
        let title = LabelLayout(text: noticeTitle, font: AppFont.style.medium(size: 15)!, numberOfLines: 1, alignment: .centerLeading) { (lbl) in
            
        }
        let content = LabelLayout<UILabel>(text: notice.content, font: AppFont.style.regular(size: 13)!, numberOfLines: 0, alignment: .centerLeading) {(lbl) in
            lbl.textColor = R.color.article_body()
            
            
        }
        
        let verStack = StackLayout(axis: .vertical,spacing: 5, sublayouts: [title,content])
        let hozStack = StackLayout(axis: .horizontal,spacing: 16, sublayouts: [img,verStack])
        super.init(insets: EdgeInsets(top: 5, left: 8, bottom: 5, right: 8), sublayout: hozStack , config : {view in
            view.backgroundColor = .white
            view.layer.cornerRadius = 6
            view.layer.borderWidth = 1.0
            view.layer.borderColor = notice.type == 1 ? R.color.congrat()!.cgColor : R.color.gradient_end()!.cgColor
        })
    }
}
