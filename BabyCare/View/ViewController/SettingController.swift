//
//  SettingController.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SettingController: ScrollableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func makeUI() {
        let header = AppHeaderLayout(bigTitle: "Tài khoản", rightImageBtn: UIImage()).defautlMakeView()
        self.addHeader(headerView: header)
        scrollView.addBlank(space: 5)
        
        let shareItem = ItemSettingLayout(img: R.image.ic_share()!, title: "Chia sẻ").defautlMakeView()
        scrollView.addMoreView(view: shareItem)
        
//
//        let helpItem = ItemSettingLayout(img: R.image.ic_help()!, title: "Trợ giúp").defautlMakeView()
//        scrollView.addMoreView(view: helpItem)
//
//        scrollView.addBlank(space: 5)
//
//        let reportItem = ItemSettingLayout(img: R.image.ic_report_error()!, title: "Báo lỗi").defautlMakeView()
//        scrollView.addMoreView(view: reportItem)
//
        scrollView.addBlank(space: 5)
        
        let logOutItem = ItemSettingLayout(img: R.image.ic_logout()!, title: "Đăng xuất").defautlMakeView()
        scrollView.addMoreView(view: logOutItem)
        logOutItem.addTapGesture(target: self, action:#selector(logout) , tapDelegate: nil)
        
        scrollView.addBlank(space: 5)
        
        
    }
    
    @objc func logout(){
        Defaults.removeAll()
        changeRootViewController(viewController: R.storyboard.main.welcomeViewController()!)
    }
    


}
