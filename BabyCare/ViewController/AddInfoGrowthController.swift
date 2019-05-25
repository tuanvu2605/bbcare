//
//  AddInfoGrowthController.swift
//  BabyCare
//
//  Created by tuananhi on 5/25/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import CarbonKit

class AddInfoGrowthController: ScrollableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func makeUI() {
        let header = AppHeaderLayout(title: "Thêm chiều cao/cân nặng", leftImageBtn: R.image.ic_Back()!).defautlMakeView()
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)
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
    }
    
    @objc func back(){
        self.dismiss(animated: false, completion: nil)
    }

}

extension AddInfoGrowthController : CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        return UIViewController()
    }
    
    
}
