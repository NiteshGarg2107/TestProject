//  APIStore.swift

import UIKit
import Alamofire

protocol APIStoreProtocol {
    func requestBaseAPI(_ url: URLConvertible, parameters: Parameters?, completion: @escaping (_ : BaseAPIModel) -> Void)
}


class APIStore: NSObject,APIStoreProtocol {
    func requestBaseAPI(_ url: URLConvertible, parameters: Parameters? = nil, completion: @escaping (_ : BaseAPIModel) -> Void) {
        requestAPI(url, parameters: parameters) { dict in
            let baseModel = BaseAPIModel.init(object: dict!)
            completion(baseModel)
        }
    }
    
    func requestBaseAPIWithImage(_ url: URLConvertible, parameters: Parameters? = nil, completion: @escaping (_ : BaseAPIModel) -> Void) {
        requestAPIWithImage(parameters: parameters! as [String : AnyObject], url: url) { (success, response) in
            print(response)
            let baseModel = BaseAPIModel.init(object: response)
            completion(baseModel)
        }
    }
}

extension APIStore {
    struct Keys {
        static let Image = "image"
        static let result = "results"
        static let message = "dataFound"
    }
    
    func requestAPI(_ url: URLConvertible, parameters: Parameters? = nil, completion: @escaping (_ : NSDictionary?) -> Void){
        Alamofire.request(url, method: .post, parameters: parameters!, encoding: URLEncoding.default, headers: [:]).responseJSON { response in
            self.getValidDict(result: response.result, completion: { (dict, error) in
                var datadict = dict
                if datadict == nil {
                    datadict = NSDictionary.init(dictionary:
                        [kResultMessageKey: error?.localizedDescription ?? "Some error has been occured",
                         kResultStatusKey: false])
                }else {
                    datadict = NSDictionary.init(dictionary:
                        [kResultMessageKey: Keys.message,
                         kResultDataKey: dict as Any,
                         kResultStatusKey: true])
                }
                completion (datadict)
            })
        }
    }
    func requestAPIWithImage( parameters:  Parameters,url: URLConvertible,Completion: @escaping (_ success: Bool,_ response: AnyObject) -> Void){
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            print(parameters)
            if Array(parameters.keys).contains(Keys.Image) {
            multipartFormData.append(UIImageJPEGRepresentation((parameters)[Keys.Image] as! UIImage, 1)!, withName: "image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            }
            for (key, value) in parameters {
                print(key,value)
                if key != Keys.Image{
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
        }, to:url)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                upload.uploadProgress(closure: { (progress) in
                    //Print progress
                })
                upload.responseJSON { response in
                    print(response.result)
                    self.getValidDict(result: response.result, completion: { (dict, error) in
                        var dict = dict
                        print(dict!)
                        print(parameters)
                        if dict == nil {
                            dict = NSDictionary.init(dictionary:
                                [kResultMessageKey: error?.localizedDescription ?? "Some error has been occured",
                                 kResultStatusKey: false])
                        }
                           Completion(true,dict![Keys.result]! as AnyObject)
                    })
               }
            case .failure(let encodingError):
                //print(encodingError.description)
                Completion(false,encodingError.localizedDescription as AnyObject)
                break
            }
        }
    }
    
    func getValidDict(result: Result<Any>, completion: @escaping (_ : NSDictionary?, _ : NSError?) -> Void) {
        var dict: NSDictionary!
        let errorNew = result.error as NSError?
        if let json = result.value {
            dict = json as! NSDictionary
        }
        completion (dict, errorNew)
    }
}
