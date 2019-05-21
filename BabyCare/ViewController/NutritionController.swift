//
//  NutritionController.swift
//  BabyCare
//
//  Created by tuananhi on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class NutritionController: ScrollableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func makeUI() {
        let header = AppHeaderLayout(title: "Chăm sóc dinh dưỡng", leftImageBtn: R.image.ic_Back()!).defautlMakeView()
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)
        self.addHeader(headerView: header)
        scrollView.addBlank(space: 16.0)
        
        addTask()
        
    }
    
    func addTask(){
        let item = TitleCheckboxLayout(title: "Cho trẻ bú bất cứ khi nào trẻ có nhu cầu cả ban ngày lần ban đêm", note: "• Còn đói sau khi bú mẹ (quấy khóc).").defautlMakeView()
        scrollView.addMoreView(view: item)
    }
    @objc func back(){
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
