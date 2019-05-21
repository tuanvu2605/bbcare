//
//  TitleCheckboxView.swift
//  BabyCare
//
//  Created by tuananhi on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class TitleCheckboxView: UIView {
    
    var btn : UIButton?

    override func layoutSubviews() {
        super.layoutSubviews()
        btn = self.viewWithTag(TitleCheckboxLayout.btnTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.btnDidTap(sender:)), for: .touchUpInside)
    }
    
    @objc func btnDidTap(sender : UIButton){
        if sender.currentImage == R.image.ic_unchecked() {
            sender.setImage(R.image.ic_checked(), for: .normal)
        }else{
            sender.setImage(R.image.ic_unchecked(), for: .normal)
        }
    }

}
