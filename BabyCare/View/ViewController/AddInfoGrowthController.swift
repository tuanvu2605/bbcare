//
//  AddInfoGrowthController.swift
//  BabyCare
//
//  Created by tuananhi on 5/25/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import CarbonKit
import SwiftyUserDefaults

protocol AddInfoGrowthControllerDelegate : NSObjectProtocol {
    func addInfoSuccess()
}

class AddInfoGrowthController: ScrollableViewController {

    weak var delegate : AddInfoGrowthControllerDelegate?
    let weightVC = GrowthViewController(nibName: "GrowthViewController", bundle: nil)
    let heightVC = GrowthViewController(nibName: "GrowthViewController", bundle: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        weightVC.type = .weight
        heightVC.type = .height

    }
    
    
    
    override func makeUI() {
        let header = AppHeaderLayout(title: "Thêm chiều cao/cân nặng", leftImageBtn: R.image.ic_Back()! , rightImageBtn: R.image.ic_checkmark()!).defautlMakeView()
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)
        
        let rightBtn = header.viewWithTag(AppHeaderLayout.rightButtonTag) as? UIButton
        rightBtn?.addTarget(self, action: #selector(self.save) , for: .touchUpInside)
        self.addHeader(headerView: header)
        
        let items = ["Chiều cao", "Cân nặng"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Size.screen.width, height: Size.screen.height - header.height))
        scrollView.addMoreView(view: view)
        carbonTabSwipeNavigation.carbonSegmentedControl?.indicatorPosition = .top
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
    
    @objc func save(){
        print("wwwwww \(weightVC.value())")
        print("hhhhhh \(heightVC.value())")
        showLoadinghud(text: "Đang cập nhật thông tin")
        AppService.addGrowthInfo(["weight":weightVC.value() , "height" : heightVC.value() , "date" : Date().toString(dateFormat : "dd/MM/yyyy") , "babyId":Defaults[.babyId]]) { (res) in
            self.hideLoadinghud()
            self.showToast(text: "Cập nhật thông tin thành công")
            Defaults[.lastWeight] = self.weightVC.value()
            Defaults[.lastHeight] = self.heightVC.value()
            if let delegate = self.delegate {
                delegate.addInfoSuccess()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }

}

extension AddInfoGrowthController : CarbonTabSwipeNavigationDelegate {
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
       
        if index == 0 {
            return heightVC;
        }else{
            return weightVC;
        }
    }
    
    
}
