//
//  HomeHeaderView.swift
//  BabyCare
//
//  Created by tuananhi on 5/31/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class HomeHeaderView: UIView {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblBabyName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var container: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        container.layer.masksToBounds = true
        container.layer.cornerRadius = 6.0
        container.dropShadow()
        imgAvatar.layer.cornerRadius = 26.0
        imgAvatar.layer.masksToBounds = true
        update()
        
    }
    
    func update(){
        lblBabyName.text = Defaults[.babyName]
        lblHeight.text = "\(Defaults[.lastHeight])"
        lblWeight.text = "\(Defaults[.lastWeight])"
        lblTime.text = Defaults[.babyBirthDay].toDate(dateFormat:"dd/MM/yyyy")?.timeAgoSinceNow
    }
    
    class func makeView()->HomeHeaderView{
        let view = Bundle.main.loadNibNamed("HomeHeaderView", owner: nil, options: nil)?.first as! HomeHeaderView
        view.frame = CGRect(x: 0, y: 0, width: Size.screen.width, height: 270)
        return view
    }


}
