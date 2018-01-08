//
//  UserStore.swift+
//

import UIKit

class UserStore: APIStore {
    
    static let shared = UserStore()

    //Register User
    func getTableData(Url: String,parameters: [String: AnyObject], Completion: @escaping (_ success: Bool,_ result: AnyObject?) -> Void) {
       requestApiWithoutImage(parameters: parameters, URL: Url) { (success,result) in
            if success {
                Completion(success,SongListData.init(json: result as! JSON).results as AnyObject)
            }else{
                Completion(success,result)
            }
        }
    }
}

//////////////////////// Extension//////////////////////////////////////////////////

enum  ConnectionError: Int,Error {
    case connectionErrro = 1
    case dataNotFound
}
extension UserStore{
    struct  Response {
        static let  connectionError = "Connection not Found"
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
