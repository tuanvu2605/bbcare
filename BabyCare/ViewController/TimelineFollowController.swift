//
//  TimelineFollowController.swift
//  BabyCare
//
//  Created by tuananhi on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import CarbonKit

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
        
        let items = ["Tuần 1" , "Tuần 2" , "Tuần 3" , "Tuần 4" , "Tuần 5" , "Tuần 6", "Tuần 7" , "Tuần 8"]
        
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Size.screen.width, height: Size.screen.height - header.height))
        scrollView.addMoreView(view: view)
        carbonTabSwipeNavigation.carbonSegmentedControl!.backgroundColor = .white
        carbonTabSwipeNavigation.insert(intoRootViewController: self, andTargetView: view)
        carbonTabSwipeNavigation.setSelectedColor(R.color.garadient_start()!, font: AppFont.style.medium(size: 18)!)
        carbonTabSwipeNavigation.setNormalColor(R.color.garadient_start()!.withAlphaComponent(0.4), font: AppFont.style.regular(size: 16)!)
        carbonTabSwipeNavigation.setIndicatorColor(R.color.garadient_start()!)
        
        
        
        
        
    }
    @objc func back(){
        self.navigationController?.popToRootViewController(animated: true)
    }

}

extension TimelineFollowController : CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        return FollowDetailController()
    }
    
    
}
