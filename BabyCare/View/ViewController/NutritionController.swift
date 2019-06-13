//
//  NutritionController.swift
//  BabyCare
//
//  Created by tuananhi on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class NutritionController: ScrollableViewController {
    
    var data = [NutritionTask]()

    override func viewDidLoad() {
        super.viewDidLoad()
        AppService.taskByMonth([:]) { (res) in
            print(res)
            if let data = res["data"] as? [[String:Any]] {
                for dict in data {
                    let task = NutritionTask(dict: dict)
                    self.data.append(task)
                }
                self.addTask()
            }
        }
        

    }
    override func makeUI() {
        let header = AppHeaderLayout(title: "Chăm sóc dinh dưỡng", leftImageBtn: R.image.ic_Back()!).defautlMakeView()
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)
        self.addHeader(headerView: header)
        scrollView.addBlank(space: 16.0)
        
    }
    
    func addTask(){
        //Cho trẻ bú bất cứ khi nào trẻ có nhu cầu cả ban ngày lần ban đêm
        for task in data {
            let task = TitleCheckboxLayout(title: task.content, note: task.note).defautlMakeView()
            scrollView.addMoreView(view: task)
        }
    }
    @objc func back(){
        let task = data.first!
        AppDelegate.shared.scheduleNotification(title: "Thông báo", detail: task.content)
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
