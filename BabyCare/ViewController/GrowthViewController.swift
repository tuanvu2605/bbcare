//
//  GrowthViewController.swift
//  BabyCare
//
//  Created by tuananhi on 5/25/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
enum GrowthType {
    case weight
    case height
}

class GrowthViewController: UIViewController {
    
    var type : GrowthType!
    @IBOutlet weak var ic: UIImageView!
    @IBOutlet weak var unitLbl: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if type == .weight {
            
            ic.image = R.image.ic_weight()!
            unitLbl.text = "Kg"
        }else{
            unitLbl.text = "Cm"
            ic.image = R.image.ic_ruler()!
        }

        // Do any additional setup after loading the view.
    }
    
    func value()->Double{
        if let value = txtField.text{
            if let n = NumberFormatter().number(from: value) {
                let f = n.doubleValue
                return f
            }else{
                return 0.0
            }
        }else{
            return 0.0
        }
    }


}
