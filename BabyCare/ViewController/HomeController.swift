//
//  HomeController.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class HomeController: ScrollableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func makeUI() {
        let header = AppHeaderLayout(bigTitle: "Theo dõi", rightImageBtn: UIImage()).defautlMakeView()
        self.addHeader(headerView: header)
        
    }

}
