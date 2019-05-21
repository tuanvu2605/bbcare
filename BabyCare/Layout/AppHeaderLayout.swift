//
//  AppHeaderLayout.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit

class AppHeaderLayout: InsetLayout<View> {
    static let rightButtonTag : Int = 3
    static let leftButtonTag : Int = 2
    
    public init(title : String , leftImageBtn : UIImage , rightImageBtn : UIImage)
    {
        let topViewLayout = SizeLayout(height: Utilities.topSpace() + Utilities.headerTopSpace() )
        
        let leftBtnLayout = ButtonLayout(type: .custom, title: "", image: .image(leftImageBtn), font: nil, contentEdgeInsets: nil, alignment: .centerLeading) { (btn) in
            btn.tag = AppHeaderLayout.leftButtonTag
            
        }
        
        let titleLayout = LabelLayout(text: title, font: AppFont.style.medium(size: 17)!, numberOfLines: 0, alignment: .center, flexibility: .max) { (lbl) in
            lbl.textColor = UIColor.white
            lbl.textAlignment = .center
            
        }
        
        let rightBtnLayout = ButtonLayout(type: .custom, title: "", image: .image(rightImageBtn), font: nil, contentEdgeInsets: nil, alignment: .centerLeading) { (btn) in
            btn.tag = AppHeaderLayout.rightButtonTag
            
        }
        
        
        
        
        let stackLayout = StackLayout(axis: .horizontal, spacing: 16.0,sublayouts:[
            leftBtnLayout,
            titleLayout,
            rightBtnLayout]
        )
        
        let headerLayout = StackLayout(axis: .vertical, spacing: 5.0,sublayouts:[
            topViewLayout,
            stackLayout]
        )
        
        
        super.init(insets: EdgeInsets(top: 5, left: 8, bottom: 5, right: 8), sublayout: headerLayout , config : {view in
            view.gradientByStyle()
        })
        
        
    }
    
    public init(title : String , leftImageBtn : UIImage)
    {
        let topViewLayout = SizeLayout(height: Utilities.topSpace() + Utilities.headerTopSpace() )
        
        let leftBtnLayout = ButtonLayout(type: .custom, title: "", image: .image(leftImageBtn), font: nil, contentEdgeInsets: nil, alignment: .centerLeading) { (btn) in
            btn.tag = AppHeaderLayout.leftButtonTag
        }
        
        let titleLayout = LabelLayout(text: title, font: AppFont.style.medium(size: 17)!, numberOfLines: 0, alignment: .fill, flexibility: .max) { (lbl) in
            lbl.textColor = UIColor.white
            lbl.textAlignment = .center
            
        }
        
        let space = SizeLayout(width: 30)
        
        let stackLayout = StackLayout(axis: .horizontal,sublayouts:[
            leftBtnLayout,
            titleLayout,
            space]
        )
        
        let headerLayout = StackLayout(axis: .vertical, spacing: 5.0,sublayouts:[
            topViewLayout,
            stackLayout]
        )
        
        
        super.init(insets: EdgeInsets(top: 5, left: 8, bottom: 5, right: 8), sublayout: headerLayout , config : {view in
            view.gradientByStyle()
        })
        
        
    }
    public init(bigTitle : String , rightImageBtn : UIImage)
    {
        let topViewLayout = SizeLayout(height: Utilities.topSpace() + Utilities.headerTopSpace() )
        
        let leftBtnLayout = ButtonLayout(type: .custom, title: "", image: .image(rightImageBtn), font: nil, contentEdgeInsets: nil, alignment: .centerTrailing) { (btn) in
            btn.tag = AppHeaderLayout.rightButtonTag
        }
        
        let titleLayout = LabelLayout(text: bigTitle, font: AppFont.style.bold(size: 28)!, numberOfLines: 0, alignment: .centerLeading, flexibility: .max) { (lbl) in
            lbl.textColor = UIColor.white
            lbl.textAlignment = .center
            
        }
        
        
        let stackLayout = StackLayout(axis: .horizontal,sublayouts:[
            titleLayout,leftBtnLayout]
        )
        
        let headerLayout = StackLayout(axis: .vertical, spacing: 5.0,sublayouts:[
            topViewLayout,
            stackLayout]
        )
        
        
        super.init(insets: EdgeInsets(top: 5, left: 16, bottom: 5, right: 16), sublayout: headerLayout , config : {view in
            view.gradientByStyle()
        })
    }

    public init(bigTitle : String , leftImageBtn : UIImage)
    {
        let topViewLayout = SizeLayout(height: Utilities.topSpace() )

        let leftBtnLayout = ButtonLayout(type: .custom, title: "", image: .image(leftImageBtn), font: nil, contentEdgeInsets: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0), alignment: .centerLeading) { (btn) in
            btn.tag = AppHeaderLayout.leftButtonTag
        }

        let titleLayout = LabelLayout(text: bigTitle, font: AppFont.style.bold(size: 28)!, numberOfLines: 0, alignment: .centerLeading, flexibility: .max) { (lbl) in
            lbl.textColor = UIColor.white
            lbl.textAlignment = .center

        }


        let stackLayout = StackLayout(axis: .horizontal,sublayouts:[titleLayout])

        let headerLayout = StackLayout(axis: .vertical, spacing: 5.0,sublayouts:[
            topViewLayout,
            leftBtnLayout,
            stackLayout]
        )


        super.init(insets: EdgeInsets(top: 5, left: 16, bottom: 5, right: 16), sublayout: headerLayout , config : {view in
            view.gradientByStyle()
        })
    }
    
}
