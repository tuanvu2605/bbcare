//
//  AppService.swift
//  BabyCare
//
//  Created by tuananhi on 5/19/19.
//  Copyright © 2019 tuananhi. All rights reserved.
//

import UIKit
import Alamofire

class AppService: NSObject {
    
    class func getAllPost(completion : @escaping(_ reponse : [String : Any])->Void){
        
        Alamofire.request(AppRouter.allPost).responseJSON { response in
            if let responseJSON = response.result.value as? [String : Any] {
                print(responseJSON)
                completion(responseJSON)
            }
        }
    }
    
    class func addGrowthInfo(_ params : [String:Any]){
        Alamofire.request(AppRouter.addGrowthInfo(params)).responseJSON { response in
            print(response)
        }
    }
    
    class func register(_ params : [String : Any] , completion : @escaping(_ reponse : [String : Any])->Void){
        Alamofire.request("\(AppRouter.baseURLPath)register", method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let responseJSON = response.result.value as? [String : Any] {
                    completion(responseJSON)
                }
        }
    }
    
    class func login(_ params : [String : Any] , completion : @escaping(_ reponse : [String : Any])->Void){
        Alamofire.request("\(AppRouter.baseURLPath)login", method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                if let responseJSON = response.result.value as? [String : Any] {
                    completion(responseJSON)
                }
        }
    }

}
