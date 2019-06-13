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
    
    var data = [FollowItem]()

    override func viewDidLoad() {
        makeData()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func makeData(){
        let w1 = FollowItem(time: "Tuần 1", height: "18.0 - 21.9 in", weight: "5.09 - 10.60 ibs", url: "BABY_Info_wk1_Boy", img: R.image.developmentImages_week1Jpg()!)
        let w2 = FollowItem(time: "Tuần 2", height: "18.5 - 22.4 in", weight: "5.47 - 11.35 ibs", url: "BABY_Info_wk2_Boy", img: R.image.developmentImages_week2Jpg()!)
        let w3 = FollowItem(time: "Tuần 3", height: "18.9 - 22.8 in", weight: "5.95 - 12.19 ibs", url: "BABY_Info_wk3_Boy", img: R.image.developmentImages_week3Jpg()!)
        let w4 = FollowItem(time: "Tuần 4", height: "19.3 - 23.2 in", weight: "6.48 - 13.03 ibs", url: "BABY_Info_wk4_Boy", img: R.image.developmentImages_week4Jpg()!)
        let w5 = FollowItem(time: "Tuần 5", height: "19.7 - 23.6 in", weight: "7.03 - 13.82 ibs", url: "BABY_Info_wk5_Boy", img: R.image.developmentImages_week5Jpg()!)
        let w6 = FollowItem(time: "Tuần 6", height: "20.0 - 23.9 in", weight: "7.54 - 14.55 ibs", url: "BABY_Info_wk6_Boy", img: R.image.developmentImages_week6Jpg()!)
        let w7 = FollowItem(time: "Tuần 7", height: "20.4 - 24.3 in", weight: "8.02 - 15.23 ibs", url: "BABY_Info_wk7_Boy", img: R.image.developmentImages_week7Jpg()!)
        let w8 = FollowItem(time: "Tuần 8", height: "20.7 - 24.8 in", weight: "8.49 - 16.09 ibs", url: "BABY_Info_wk8_Boy", img: R.image.developmentImages_week8Jpg()!)
        data.append(w1)
        data.append(w2)
        data.append(w3)
        data.append(w4)
        data.append(w5)
        data.append(w6)
        data.append(w7)
        data.append(w8)
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
        let vc = FollowDetailController()
        vc.followItem = data[Int(index)]
        return vc
    }
    
    
}
