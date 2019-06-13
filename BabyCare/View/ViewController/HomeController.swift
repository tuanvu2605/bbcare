//
//  HomeController.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import LayoutKit
import SwiftyUserDefaults

class HomeController: ScrollableViewController {

    var header : HomeHeaderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        AppService.userInfo(["uid":Defaults[.userId]]) { (res) in
            if let dict = res["data"] as? [String : Any] {
                let user = User(dict : dict)
                AppModel.shared.user = user
                if user.babies.count > 0 {
                    AppModel.shared.babyId = user.babies.first!.id
                    Defaults[.babyId] = user.babies.first!.id
                }
            }
        }
        
        AppService.getLastGrowthInfo { (res) in
            if let data = res["data"] as? [String:Any] {
                Defaults[.lastWeight] = data["weight"] as! Double
                Defaults[.lastHeight] = data["height"] as! Double
            }
      
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        header.update()
        
    }
    
    override func makeUI() {
        header = HomeHeaderView.makeView()
        header.setHeight(h: 270)
        
        scrollView.addMoreView(view: header)
        
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
        let vc = AddInfoGrowthController()
        vc.delegate = self
        present(vc, animated: true) {
            
        }
    }
    
    
    @objc func viewChartDidTap(){
        let vc = GrowthChartViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func viewNutritionDidTap(){
        let vc = NutritionController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func viewFollowDidTap(){
        let vc = TimelineFollowController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}

extension HomeController : AddInfoGrowthControllerDelegate {
    func addInfoSuccess() {
        self.header.update()
    }
    
    
}
