//
//  BlogDetailController.swift
//  BabyCare
//
//  Created by tuananhi on 5/19/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import WebKit

class BlogDetailController: ScrollableViewController {

    var webView : WKWebView!
    var blog : Blog!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func makeUI() {
        let header = AppHeaderLayout(title: "Blog", leftImageBtn: R.image.ic_Back()!).defautlMakeView()
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)
        addHeader(headerView: header)
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: Size.screen.width, height: Size.screen.height - header.height - (self.tabBarController?.tabBar.height ?? 0)))
        scrollView.addMoreView(view: webView)
        scrollView.isScrollEnabled = false
        let url = URL(string: "\(AppRouter.baseURLPath)\(blog.url)")!
        webView.load(URLRequest(url: url))
//        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    @objc func back(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
