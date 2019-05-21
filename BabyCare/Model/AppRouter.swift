//
//  AppRouter.swift
//  iCorrect
//
//  Created by tuananh on 1/31/18.
//  Copyright © 2018 tuananh. All rights reserved.
//

import Foundation
import Alamofire

public enum AppRouter: URLRequestConvertible {
    
    static let baseURLPath = "http://localhost:3000/"
    
    case login(Dictionary<String,Any>)
    case register(Dictionary<String,Any>)
    case addGrowthInfo(Dictionary<String,Any>)
    case userInfo
    case babyInfo
    case allPost
    
  
    
    var method: HTTPMethod {
        switch self {
        case .login ,.userInfo , .babyInfo , .register , .addGrowthInfo:
            return .post
        case .allPost:
            return .get
        default:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "auth/login"
        case .userInfo:
            return "user/info"
        case .babyInfo:
            return "user/babyinfo"
        case .allPost:
            return "post/all"
        case .addGrowthInfo:
            return "growthinfo/addnew"
        case .register:
            return "register"
        default:
            return ""
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let parameters: [String: Any]! = {
            switch self {
            case .login(let dict) , .addGrowthInfo(let dict) , .register(let dict) :
                return dict;
                
            default:
                return [:]
            }
        }()
        
        let url = try AppRouter.baseURLPath.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
//        if let access_token = "" , let token_type = "" {
//            request.setValue(token_type + " " + access_token, forHTTPHeaderField: "AUTHORIZATION")
//        }
//
        request.timeoutInterval = TimeInterval(10 * 1000)
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}

