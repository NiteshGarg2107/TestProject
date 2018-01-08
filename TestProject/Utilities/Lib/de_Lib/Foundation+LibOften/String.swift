//
//  String.swift


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
    
    func imageUrl() -> URL? {
        let imageURL = URL(string: self)
        return imageURL
    }
    
}


