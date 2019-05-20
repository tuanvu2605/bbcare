//
//  UIViewController+Extensions.swift
//  Epay
//
//  Created by tuananh on 3/26/19.
//  Copyright © 2019 tuananh. All rights reserved.
//

import UIKit
import MBProgressHUD
import KLCPopup

extension UIViewController
{
    
    func showLoadinghud(text : String){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.isSquare = false
        hud.bezelView.layer.cornerRadius = 8.0
        hud.offset.y = 5
        hud.mode = .indeterminate
        hud.label.text = text
        hud.label.font = AppFont.style.medium(size: 16)
        hud.label.numberOfLines = 0
        hud.bezelView.backgroundColor = UIColor.black
        hud.contentColor = UIColor.white
    }
    
    func showToast(text : String){
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.isSquare = false
        hud.bezelView.layer.cornerRadius = 8.0
        hud.offset.y = 5
        hud.mode = .text
        hud.label.text = text
        hud.label.font = AppFont.style.medium(size: 16)
        hud.label.numberOfLines = 0
        hud.bezelView.backgroundColor = UIColor.black
        hud.contentColor = UIColor.white
    }
    
    func showCenterPopup(view : UIView){
        
        let popup = KLCPopup(contentView: view, showType: KLCPopupShowType.slideInFromBottom, dismissType: .slideOutToBottom, maskType: .dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        popup?.show()
    }
    
    func hideLoadinghud(){
        MBProgressHUD.hide(for: self.view, animated: true)
    }
}

