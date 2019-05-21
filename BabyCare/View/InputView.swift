//
//  InputView.swift
//  BabyCare
//
//  Created by trungduc on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class InputView: UITextField {

    @IBInspectable var enableSecurityView: Bool = false {
        didSet {
            if enableSecurityView {
                rightViewMode = .always
            } else {
                rightViewMode = .never
            }
        }
    }

    override var isSecureTextEntry: Bool {
        didSet {
            guard let rightView = self.rightView as? UIButton else {
                return
            }
            rightView.isSelected = !isSecureTextEntry
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        borderStyle = .none

        layer.cornerRadius = 6
        layer.borderWidth = 1
        layer.borderColor = UIColor(hexString: "e2e2e2").cgColor

        let rightView = UIButton()
        rightView.setImage(R.image.security_on(), for: .normal)
        rightView.setImage(R.image.security_off(), for: .selected)
        rightView.addTarget(self, action: #selector(changeSecureTextEntry), for: .touchUpInside)
        self.rightView = rightView
    }

    @objc func changeSecureTextEntry() {
        guard let rightView = self.rightView as? UIButton else {
            return
        }
        isSecureTextEntry = rightView.isSelected
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 16, y: 0, width: bounds.width - 2 * 16, height: bounds.height)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        if enableSecurityView {
            return CGRect(x: bounds.width - 32, y: 0, width: 16, height: bounds.height)
        }
        return .zero
    }

}
