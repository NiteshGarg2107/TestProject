//
//  String.swift
//  Dropneed
//
//  Created by Lakhwinder Singh on 19/04/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit

extension String {

    var isEmpty: Bool {
        return count == 0 && trimmingCharacters(in: .whitespaces).count == 0
    }
    
    var float: Float {
        return Float(self)!
    }
    
    var int: Int {
        return Int(self)!
    }
    
    var length: Int {
        return count
    }
    
}


