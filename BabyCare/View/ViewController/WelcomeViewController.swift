//
//  WelcomeViewController.swift
//  BabyCare
//
//  Created by trungduc on 5/21/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
    }

    func setupSubviews() {
        signinButton.gradientByStyle(opacity: 0.1)
        signinButton.titleLabel?.font = AppFont.style.medium(size: 16)

        signupButton.gradientByStyle()
        signupButton.titleLabel?.font = AppFont.style.medium(size: 16)
    }

    @IBAction func signinButtonDidTouch(_ sender: Any) {
        let signinViewController = R.storyboard.main.signinViewController()!
        self.present(signinViewController, animated: false, completion: nil)
    }

    @IBAction func signupButtonDidTouch(_ sender: Any) {
        let signupViewController = R.storyboard.main.signupViewController()!
        self.present(signupViewController, animated: false, completion: nil)
    }

}
