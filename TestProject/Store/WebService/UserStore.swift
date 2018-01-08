//
//  UserStore.swift
//  SNAKEMAIL
//
//  Created by CS on 13/06/17.
//  Copyright © 2017 CS. All rights reserved.
//

import UIKit

class UserStore: APIStore {
    
    static let shared = UserStore()

    //Register User
    func registerUser(Url: String,parameters: [String: AnyObject], Completion: @escaping (_ success: Bool,_ result: AnyObject?) -> Void) {
       requestApiWithoutImage(parameters: parameters, URL: Url) { (success,result) in
            if success {
                Completion(success,Response.registeredSuccessfully as AnyObject)
            }else{
                Completion(success,result)
            }
        }
    }
}

///////////////////////////////////////////Extension//////////////////////////////////////////////////////

extension UserStore{
    struct  keys {
        static let verifyStatus = "verifyStatus"
        static let userId = "userId"
        static let name = "name"
    }
    struct  Response {
        static let registeredSuccessfully = "you have register successfully"
        static let loginSuccessfully = "you have login successfully"
        static let  connectionError = "you have login successfully"
        static let varifyStatus = "Plese varify your account First"
    }
    
    func requestApiWithImage(parameters: [String: AnyObject],URL: String, Completion: @escaping (_ success: Bool,_ result: AnyObject?) -> Void) {
        requestBaseAPIWithImage(URL,parameters: parameters) { (baseModel) in
            if baseModel.status! {
                Completion(baseModel.status!,baseModel.data as AnyObject)
            }else{
                Completion(baseModel.status!, Response.connectionError as AnyObject)
            }
        }
    }
    
    func requestApiWithoutImage(parameters: [String: AnyObject],URL: String, Completion: @escaping (_ success: Bool,_ result: AnyObject?) -> Void) {
        requestBaseAPI(URL,parameters: parameters) { (baseModel) in
            if baseModel.status! {
                Completion(baseModel.status!,baseModel.data as AnyObject)
            }else{
                Completion(baseModel.status!, Response.connectionError as AnyObject)
            }
        }
    }
}
