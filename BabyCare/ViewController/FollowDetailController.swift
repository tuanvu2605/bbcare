//
//  FollowDetailController.swift
//  BabyCare
//
//  Created by tuananhi on 5/24/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import WebKit

class FollowDetailController: ScrollableViewController {
    var followItem : FollowItem!
    var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func makeUI() {
        self.followItem = FollowItem(time: "Tuần 1", height: "18.0 - 21.9 in", weight: "5.09 - 10.60 ibs", url: "BABY_Info_wk1_Boy", img: R.image.developmentImages_week1Jpg()!)
        let followItemView = FollowItemLayout(followItem:self.followItem).defautlMakeView()
        scrollView.addBlank(space: 12)
        scrollView.addMoreView(view: followItemView)
        
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: Size.screen.width, height: Size.screen.height - 100))
        scrollView.addMoreView(view: webView)
        scrollView.isScrollEnabled = false
        let url = Bundle.main.url(forResource: followItem.url, withExtension: "html", subdirectory: nil)!
        webView.loadFileURL(url, allowingReadAccessTo: url)
        let request = URLRequest(url: url)
        webView.load(request)
    }
    


}
