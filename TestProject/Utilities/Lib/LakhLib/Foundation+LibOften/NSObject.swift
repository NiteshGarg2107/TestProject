//
//  NSObject.swift
//  SNAKEMAIL
//
//  Created by CS on 22/06/17.
//  Copyright © 2017 CS. All rights reserved.
//

import Foundation
extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

