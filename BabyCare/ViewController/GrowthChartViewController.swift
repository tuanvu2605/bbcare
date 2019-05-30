//
//  GrowthChartViewController.swift
//  BabyCare
//
//  Created by tuananhi on 5/30/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import CarbonKit
import SwiftyUserDefaults


class GrowthChartViewController: ScrollableViewController {
    
    let weightVC = ChartViewController()
    let heightVC = ChartViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        weightVC.type = .weight
        heightVC.type = .height
        
    }
    
    
    
    override func makeUI() {
        
        let header = AppHeaderLayout(bigTitle: "Timeline", rightImageBtn: UIImage()).defautlMakeView()
        self.addHeader(headerView: header)
        let items = ["Chiều cao", "Cân nặng"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Size.screen.width, height: Size.screen.height - header.height))
        scrollView.addMoreView(view: view)
        carbonTabSwipeNavigation.carbonSegmentedControl!.backgroundColor = .white
        carbonTabSwipeNavigation.insert(intoRootViewController: self, andTargetView: view)
        carbonTabSwipeNavigation.setSelectedColor(R.color.garadient_start()!, font: AppFont.style.medium(size: 18)!)
        carbonTabSwipeNavigation.setNormalColor(R.color.garadient_start()!.withAlphaComponent(0.4), font: AppFont.style.regular(size: 16)!)
        carbonTabSwipeNavigation.setIndicatorColor(R.color.garadient_start()!)
        for i in 0..<2
        {
            carbonTabSwipeNavigation.carbonSegmentedControl?.setWidth(Size.screen.width/2, forSegmentAt: i)
        }
        scrollView.addBlank(space: 25)
    }
    
    
}

extension GrowthChartViewController : CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        
        if index == 0 {
            return heightVC;
        }else{
            return weightVC;
        }
    }
    
    
}
