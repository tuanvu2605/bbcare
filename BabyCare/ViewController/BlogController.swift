//
//  BlogController.swift
//  BabyCare
//
//  Created by tuananhi on 5/17/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import SDWebImage

class BlogController: ScrollableViewController {

    var tableView : UITableView!
    var cellId = "cellId"
    var data = [Blog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppService.getAllPost { (res) in
            if let list = res["data"] as? [[String:Any]] {
                for dict in list {
                    let blog = Blog(dict: dict)
                    self.data.append(blog)
                    self.tableView.reloadData()
                    
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    override func makeUI() {
        let header = AppHeaderLayout(bigTitle: "Blog", rightImageBtn: R.image.ic_plus_header()!).defautlMakeView()
        self.addHeader(headerView: header)
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: Size.screen.width, height: Size.screen.height - header.height), style: .plain)
        self.scrollView.addMoreView(view: tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "BlogCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: self.tabBarController?.tabBar.height ?? 0, right: 0)
        
    }
    
    
    

}

extension BlogController : UITableViewDelegate , UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! BlogCell
        let b = data[indexPath.row]
        cell.title.text = b.title
        cell.thumbnail.sd_setImage(with: URL(string: b.thumbnail), completed: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let b = data[indexPath.row]
        let blogDetail = BlogDetailController()
        blogDetail.blog = b
        self.navigationController?.pushViewController(blogDetail, animated: true)
    }
}
