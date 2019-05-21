//
//  SigninViewController.swift
//  BabyCare
//
//  Created by trungduc on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var signinButton: UIButton!

    @IBOutlet weak var emailTextField: InputView!
    @IBOutlet weak var passwordTextField: InputView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }

    func setupSubviews() {
        let header = AppHeaderLayout(bigTitle: "Đăng nhập", leftImageBtn: R.image.ic_Back()!).defautlMakeView()
        view.addSubview(header)
        view.bringSubviewToFront(header)
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)

        containerView.dropShadow()
        containerView.layer.shadowOpacity = 0.3

        signinButton.gradientByStyle()
        signinButton.isHidden = true
    }

    @IBAction func textDidChanged(_ sender: Any) {
        signinButton.isHidden = emailTextField.text!.count < 8 || passwordTextField.text!.count < 8
    }

    @objc func back() {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func signinButtonDidTouch(_ sender: Any) {
    }

    @IBAction func forgotPasswordButtonDidTouch(_ sender: Any) {
    }
}
