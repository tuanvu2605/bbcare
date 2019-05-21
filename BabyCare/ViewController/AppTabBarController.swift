//
//  BCPTabBarController.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit

class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let home = HomeController()
        let navHome = AppNavigationController(rootViewController: home)
        navHome.tabBarItem = UITabBarItem(title: "Theo dõi", image: R.image.ic_baby_feet_tabbar(), tag: 0)
        
        
        let blog = BlogController()
        let navBlog = AppNavigationController(rootViewController: blog)
        blog.tabBarItem = UITabBarItem(title: "Blogs", image: R.image.ic_blog_tabbar()!, selectedImage: R.image.ic_blog_hl_tabbar())
        
        let chat = UIStoryboard.initial(storyboard:.conversations)
        chat.tabBarItem = UITabBarItem(title: "Tư vấn", image: R.image.icChatTabbar(), tag: 1)
        
        let setting = SettingController()
        setting.tabBarItem = UITabBarItem(title: "Tài khoản", image: R.image.ic_account_tabbar(), tag: 2)
        
        viewControllers = [navHome,navBlog,chat,setting]
        tabBar.tintColor = R.color.garadient_start()
        
    }
    private let manager = UserManager()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let user = ObjectUser()
        user.email = "tuanv.2605@gmail.com"
        user.password = "12345678"
        ThemeService.showLoading(true)
        manager.login(user: user) {[weak self] response in
            ThemeService.showLoading(false)
            switch response {
            case .failure: self?.showAlert()
            case .success: self?.dismiss(animated: true, completion: nil)
            }
        }
    }

}
