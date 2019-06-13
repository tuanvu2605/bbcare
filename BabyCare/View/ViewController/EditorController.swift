//
//  EditorController.swift
//  BabyCare
//
//  Created by tuananhi on 6/2/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import WordPressEditor
import SwiftyUserDefaults

class EditorController: WPEditorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.setNavigationBarHidden(false, animated: false)
        self.title = "Tạo blog"
        let cancel = UIBarButtonItem(title: "Hủy", style: .plain, target: self, action: #selector(self.cancel))
        navigationItem.leftBarButtonItem = cancel
        
        let save = UIBarButtonItem(title: "Lưu", style: .done, target: self, action: #selector(self.save))
        navigationItem.rightBarButtonItem = save
        // Do any additional setup after loading the view.
    }
    
    @objc func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func save(){
        self.view.endEditing(true)
        showLoadinghud(text: "Đang tạo blog...")
        let params = ["title":self.editorView.titleField.html()! , "content" : editorView.contentField.html()! , "userId" : Defaults[.userId]] 
        AppService.createBlog(params) { (res) in
            self.hideLoadinghud()
            if res["status"] as? Int  == 1 {
                self.showToast(text: "Tạo blog thành công")
                self.dismiss(animated: true, completion: nil)
            }
            
        }
    }
    



}
