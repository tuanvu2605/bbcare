//
//  SignupViewController.swift
//  BabyCare
//
//  Created by trungduc on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class SignupViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var emailTextField: InputView!
    @IBOutlet weak var passwordTextField: InputView!
    @IBOutlet weak var reenterPasswordTextField: InputView!

    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }

    func setupSubviews() {
        let header = AppHeaderLayout(bigTitle: "Đăng ký", leftImageBtn: R.image.ic_Back()!).defautlMakeView()
        view.addSubview(header)
        view.bringSubviewToFront(header)
        let btn = header.viewWithTag(AppHeaderLayout.leftButtonTag) as? UIButton
        btn?.addTarget(self, action: #selector(self.back) , for: .touchUpInside)

        containerView.dropShadow()
        containerView.layer.shadowOpacity = 0.3

        signupButton.gradientByStyle()
        signupButton.isHidden = true
    }

    @IBAction func textDidChanged(_ sender: Any) {
        signupButton.isHidden = emailTextField.text!.count < 8 || passwordTextField.text!.count < 8 || passwordTextField.text != reenterPasswordTextField.text
    }

    @objc func back() {
        dismiss(animated: false, completion: nil)
    }

    @IBAction func forgotPasswordButtonDidTouch(_ sender: Any) {
    }

    @IBAction func signupButtonDidTouch(_ sender: Any) {
        self.view.endEditing(true)
        showLoadinghud(text: "Vui lòng chờ...")
        let email = emailTextField.text!
        let password = passwordTextField.text!
        AppService.register(["email":email , "password":password]) { (res) in
            self.hideLoadinghud()
            print(res)
            if res["status"] as? Int  == 1 {
                let data = res["data"] as! [String : Any]
                let user = User()
                user.uid = data["_id"] as! String
                let localDict = data["local"] as! [String : Any]
                user.email = localDict["email"] as! String
                Defaults[.userId] = user.uid
                AppModel.shared.user = user
                let tabbarController = AppTabBarController()
                self.changeRootViewController(viewController: tabbarController)
                
                
            }else{
                
            }
            
        }
    }

}
