//
//  TimelineFollowController.swift
//  BabyCare
//
//  Created by tuananhi on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class TimelineFollowController: ScrollableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func makeUI() {
        let header = AppHeaderLayout(title: "Theo dõi phát triển", leftImageBtn: R.image.ic_Back()!).defautlMakeView()
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)
        self.addHeader(headerView: header)
        
    }
    @objc func back(){
        self.navigationController?.popToRootViewController(animated: true)
    }

}
