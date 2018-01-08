//
//  Float.swift

import UIKit

extension Float {

    func price(_ symbol: String) -> String {
        return NSString(format: "%@%.2f", symbol, self) as String
    }
    
    var string: String {
        return NSString(format: "%.2f", self) as String
    }
    
}

extension Int {
    
    var string: String {
        return NSString(format: "%i", self) as String
    }
    
}

