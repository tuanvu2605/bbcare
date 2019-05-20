//
//  UIView+Extensions.swift
//  AMNOBase
//
//  Created by tuananh on 1/26/19.
//  Copyright © 2019 tuananh. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore
import LayoutKit


extension InsetLayout {
    func defautlMakeView()->UIView{
        return self.arrangement(origin: CGPoint.zero, width: Size.screen.width).makeViews()
    }
}

extension UIView {
    
    func addDashedBorder() {
        let color = UIColor.red.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [6,3]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func gradientByStyle(){
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds;
        gradient.colors = [R.color.garadient_start()!.cgColor ,R.color.gradient_end()!.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0.5, height: 4.0)
        layer.shadowRadius = 5
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    func cardShadow(cornerRadius : CGFloat){
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        layer.shadowOpacity = 0.25
        layer.shadowPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
    }
    
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addTapGesture(target: Any, action: Selector? , tapDelegate : UIGestureRecognizerDelegate? )
    {
        let tap = UITapGestureRecognizer(target: target, action: action)
        tap.delegate = tapDelegate
        self.addGestureRecognizer(tap)
        
    }
    
    func addLongPressGesture(target: Any, action: Selector? , lPressDelegate : UIGestureRecognizerDelegate? )
    {
        let longPress = UILongPressGestureRecognizer(target: target, action: action)
        longPress.delegate = lPressDelegate
        self.addGestureRecognizer(longPress)
        
    }
    
    func setY(y : CGFloat){
        self.setY(y: y, animated: false)
    }
    
    func setX(x : CGFloat){
        self.setX(x:x , animated: false)
    }
    
    func setY(y : CGFloat , animated : Bool)
    {
        var vFrame = self.frame
        vFrame.origin.y = y;
        if animated{
            UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseIn, animations: {
                self.frame = vFrame
            }, completion: nil)
            
        }else
        {
            self.frame = vFrame
        }
        
    }
    
    func setX(x : CGFloat , animated : Bool)
    {
        var vFrame = self.frame
        vFrame.origin.x = x;
        if animated{
            UIView.animate(withDuration: 0.15, delay: 0, options: .curveEaseIn, animations: {
                self.frame = vFrame
            }, completion: nil)
            
        }else
        {
            self.frame = vFrame
        }
        
    }
    
    func increaseHeight(i : CGFloat){
        var vFrame = self.frame
        vFrame.size.height = self.height + i;
        self.frame = vFrame
    }
    
    func increaseHeight(i : CGFloat , completion :@escaping (_ finished : Bool)->()){
        var vFrame = self.frame
        vFrame.size.height = self.height + i;
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .beginFromCurrentState, animations: {
            self.frame = vFrame
        }) { (isFinish) in
            completion(isFinish)
        }
    }
    func decreaseHeight(i : CGFloat){
        var vFrame = self.frame
        vFrame.size.height = self.height - i;
        self.frame = vFrame
    }
    
    
    func setHeight(h : CGFloat)
    {
        var vFrame = self.frame
        vFrame.size.height = h;
        self.frame = vFrame
    }
    func setWidth(w : CGFloat)
    {
        var vFrame = self.frame
        vFrame.size.width = w;
        self.frame = vFrame
    }
    func setHeight(h : CGFloat , animated : Bool)
    {
        var vFrame = self.frame
        vFrame.size.height = h;
        self.frame = vFrame
    }
    
    var x :  CGFloat {
        return self.frame.origin.x
    }
    var y :  CGFloat {
        return self.frame.origin.y
    }
    
    var height :  CGFloat {
        return self.frame.size.height
    }
    var width :  CGFloat {
        return self.frame.size.width
    }
}
extension UIButton {
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

extension UIImage {
    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        
        let size = self.size
        let aspectRatio =  size.width/size.height
        
        switch contentMode {
        case .scaleAspectFit:
            if aspectRatio > 1 {                            // Landscape image
                width = dimension
                height = dimension / aspectRatio
            } else {                                        // Portrait image
                height = dimension
                width = dimension * aspectRatio
            }
            
        default:
            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
        }
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = opaque
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
            newImage = renderer.image {
                (context) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

