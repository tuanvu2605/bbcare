//
//  HomeController.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit

class HomeController: ScrollableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let params = ["weight" : 10 , "height" : 10 , "date" : "10/10/2019" , "babyId" : "5ce36374a33e129d6c7d281d"] as [String : Any]
//        let rParams = ["email":"user01@gmail.com", "password":"12345678"]
////        AppService.register(rParams)

    }
    
    override func makeUI() {
        let header = AppHeaderLayout(bigTitle: "Theo dõi", rightImageBtn: UIImage()).defautlMakeView()
        self.addHeader(headerView: header)
        
        scrollView.addBlank(space: 100)
        
        let btn = ButtonLayout(type: .custom, title: "  Nhập chiều cao/cân nặng", image: .image(R.image.ic_plus()), font: AppFont.style.medium(size: 17), alignment: .center) { (btn) in
            btn.setTitleColor(R.color.garadient_start(), for: .normal)
            btn.addTarget(self, action: #selector(self.addGrowthInfo), for: .touchUpInside)
            
            }.arrangement(origin: .zero , width : Size.screen.width ).makeViews()
        self.scrollView.addMoreView(view: btn)
        
        scrollView.addBlank(space: 12)
        let chartView = HomeItem(img: R.image.ic_line_chart()!, title: "Biểu đồ tăng trưởng", description: "Theo dõi sự tăng trưởng về chiều cao và cân nặng").arrangement(origin: CGPoint(x: 16, y: 0), width: Size.screen.width - 32).makeViews()
        self.scrollView.addMoreView(view: chartView)
        scrollView.addBlank(space: 16)
        chartView.addTapGesture(target: self, action: #selector(self.viewChartDidTap), tapDelegate: nil)
        
        let followView = HomeItem(img: R.image.ic_statistics()!, title: "Theo dõi sự phát triển", description: "Thông tin tham khảo về sự phát triển của trẻ qua từng tháng").arrangement(origin: CGPoint(x: 16, y: 0), width: Size.screen.width - 32).makeViews()
        followView.addTapGesture(target: self, action: #selector(self.viewFollowDidTap), tapDelegate: nil)
        self.scrollView.addMoreView(view: followView)
        scrollView.addBlank(space: 16)
        
        let nutritionView = HomeItem(img: R.image.ic_vegetarian()!, title: "Chăm sóc dinh dưỡng", description: "Các lời khuyên & phương pháp dinh dưỡng cho trẻ").arrangement(origin: CGPoint(x: 16, y: 0), width: Size.screen.width - 32).makeViews()
        self.scrollView.addMoreView(view: nutritionView)
        nutritionView.addTapGesture(target: self, action: #selector(self.viewNutritionDidTap), tapDelegate: nil)
        
    }
    
    
    @objc func addGrowthInfo(){
        present(AddInfoGrowthController(), animated: true) {
            
        }
    }
    
    
    @objc func viewChartDidTap(){
        
    }
    
    @objc func viewNutritionDidTap(){
        let vc  = NutritionController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func viewFollowDidTap(){
        let vc = TimelineFollowController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
