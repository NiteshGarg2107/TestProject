//
//  Date.swift
//  Dropneed
//
//  Created by Lakhwinder Singh on 10/05/17.
//  Copyright © 2017 lakh. All rights reserved.
//

import UIKit

extension Date {

    func string(_ format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func StringFromStyle(_ datestyle: DateFormatter.Style,timeStyle: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datestyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.string(from: self)

    }
}

//////////////////////////////////////////////////////////////////////////////////////////

/*
 String extension only for date methods
 */
extension String {
    
    func date(_ format: String) -> Date {
        print(self)
        print(format)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
//        let medDate = dateFormatter.date(from: self)
//        let secondFormatter = DateFormatter()
//        secondFormatter.dateFormat = "dd-MM-yyyy"
//        print(secondFormatter.string(from: medDate!))
        return dateFormatter.date(from: self)!
    }
    
    func dateFromStyle(_ datestyle: DateFormatter.Style,timeStyle: DateFormatter.Style) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = datestyle
        dateFormatter.timeStyle = timeStyle
        return dateFormatter.date(from: self)!
    }
    
    func imageUrl() -> URL? {
        let imageURL = URL(string: "\(imageUrl)/\(self)")
        return imageURL
    }
    func ChallengeImageUrl() -> URL? {
        let imageURL = URL(string: "\(ChallengeImageUrl)/\(self)")
        return imageURL
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound - r.lowerBound)
        return String(self[Range(start ..< end)])
    }
}



