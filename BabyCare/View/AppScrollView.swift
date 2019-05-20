//
//  BCPScrollView.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit


class AppScrollView: UIScrollView {
    
    var posY : CGFloat = 0.0
    var items = [UIView]()
    
    func addMoreView(view : UIView)
    {
        view.setY(y: posY)
        super.addSubview(view)
        posY = view.height + posY
        items.append(view)
        contentSize = CGSize(width: self.width, height: posY + 20)
        
    }
    
    
    func addMoreView(view : UIView ,  near : UIView)
    {
        view.setY(y: near.y)
        view.setX(x: near.x + near.width, animated: false)
        super.addSubview(view)
        
    }
    
    
    
    func addBlank(space : CGFloat)
    {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.width, height: space))
        view.backgroundColor = UIColor.clear
        self.addMoreView(view: view)
    }
    func addSpaceView(height : CGFloat , color : UIColor) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.width, height: height))
        view.backgroundColor = color
        self.addMoreView(view: view)
    }
    
    func reloadSubView(){
        var currentY : CGFloat = 0.0
        for s in self.subviews {
            s.setY(y: currentY , animated : true)
            currentY = currentY + s.height
        }
        var size = self.contentSize
        size.height = currentY
        
        
    }
    
}

