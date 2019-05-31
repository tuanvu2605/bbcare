//
//  BabyInfoViewController.swift
//  BabyCare
//
//  Created by tuananhi on 5/25/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import FSPagerView
import SwiftyUserDefaults

class BabyInfoViewController: UIViewController {

    @IBOutlet weak var pagerView: FSPagerView!
    var genderIndex = 0
    fileprivate let imageNames = ["boy_type","girl_type"]
    @IBOutlet weak var yourNameTxt: InputView!
    @IBOutlet weak var birthdayTxt: InputView!
    @IBOutlet weak var babyNameTxt: InputView!
    @IBOutlet weak var weeksWhenBorn: InputView!
    @IBOutlet weak var heightBorn: InputView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let header = AppHeaderLayout(title: "Thông tin bắt đầu", leftImageBtn: R.image.ic_Back()! ).defautlMakeView()
        self.view.addSubview(header)
        self.view.bringSubviewToFront(header)
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)
        
        self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        self.pagerView.transformer = FSPagerViewTransformer(type:.linear)
        let transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.pagerView.itemSize = self.pagerView.frame.size.applying(transform)
        self.pagerView.decelerationDistance = FSPagerView.automaticDistance
        pagerView.delegate = self
        pagerView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @objc func back(){
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func confirmDidTap(_ sender: Any) {
        if yourNameTxt.text!.isEmpty || birthdayTxt.text!.isEmpty || babyNameTxt.text!.isEmpty || weeksWhenBorn.text!.isEmpty {
            showToast(text: "Vui lòng điền đầy đủ thông tin")
            return
        }
        let userId = Defaults[.userId]
        let params = ["yourname":yourNameTxt.text! , "name":babyNameTxt.text! , "gender":genderIndex , "monthwhenborn":30 , "relationship":1,"userId": userId,"birthday":birthdayTxt.text!,"bornplace":"vn" , "bornWeight":weeksWhenBorn.text! , "bornHeight":heightBorn.text!] as [String : Any]
        showLoadinghud(text: "Đang cập nhật thông tin")
        AppService.updateBabyInfo(params) { (res) in
            if let dict = res["data"] as? [String : Any] {
                let baby = Baby(dict: dict)
                AppModel.shared.user?.babies.append(baby)
                AppModel.shared.babyId = baby.id
                Defaults[.babyId] = baby.id
                Defaults[.lastWeight] = self.weeksWhenBorn.text!.toDouble()
                Defaults[.lastHeight] = self.heightBorn.text!.toDouble()
                Defaults[.babyName] = self.babyNameTxt.text!
                Defaults[.babyBirthDay] = self.birthdayTxt.text!
            }
            self.hideLoadinghud()
            self.dismiss(animated: true, completion: nil)
            
            
        }
        
        
    }
    


}

extension BabyInfoViewController : FSPagerViewDelegate , FSPagerViewDataSource{
    // MARK:- FSPagerViewDataSource
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        print("targetIndex \(targetIndex)")
        genderIndex = targetIndex
    }
    
}
