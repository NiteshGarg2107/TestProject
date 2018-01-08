//
//  JS_NSObject.swift
//  GampzApp
//
//  Created by CSPC178 on 16/03/17.
//  Copyright © 2017 CSPC178cs. All rights reserved.
//

import Foundation

extension Collection {
    
    func toJsonString() -> String {
        var jsonStringText = ""
        do {
            //Convert to Data
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            //Convert back to string. Usually only do this for debugging
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                jsonStringText = JSONString
                print(JSONString)
            }
            _ = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: AnyObject]
        } catch {
            //print(error.description)
        }
        return jsonStringText
    }
}
