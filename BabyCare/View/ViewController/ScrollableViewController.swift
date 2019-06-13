//
//  EPScrollableViewController.swift
//  Epay
//
//  Created by tuananh on 3/15/19.
//  Copyright © 2019 tuananh. All rights reserved.
//

import UIKit

protocol NeedUI {
    func makeUI()
}

class ScrollableViewController: UIViewController , NeedUI {
    
    
    
    var scrollView = AppScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        scrollView.frame = CGRect(x: 0, y: 0, width: Size.screen.width, height: Size.screen.height)
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = false
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
        makeUI()
        // Do any additional setup after loading the view.
    }
    
    func makeUI() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: self.tabBarController?.tabBar.height ?? 0, right: 0)
        self.edgesForExtendedLayout = []
        
        
    }
    func addHeader(headerView : UIView){
        self.scrollView.addBlank(space: headerView.height)
        self.view.addSubview(headerView)
        self.view.bringSubviewToFront(headerView)
    }
    
    func addActionButton(title : String){
        let actionButton = AppBottomButtonLayout(bottomButtonTitle: title, sel: #selector(self.actionButtonDidTap)).arrangement(origin: CGPoint.zero, width: Size.screen.width).makeViews()
        actionButton.frame  = CGRect(x: 0, y: Size.screen.height - actionButton.height - (self.tabBarController?.tabBar.height ?? 0), width: Size.screen.width, height: actionButton.height)
        self.view.addSubview(actionButton);
        self.view.bringSubviewToFront(actionButton)
    }
    @objc func actionButtonDidTap(){
        
    }
    
}
