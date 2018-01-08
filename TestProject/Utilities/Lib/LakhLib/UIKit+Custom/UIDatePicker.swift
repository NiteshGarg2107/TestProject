//
//  UIDatePicker.swift
//  SNAKEMAIL
//
//  Created by CS on 13/06/17.
//  Copyright © 2017 CS. All rights reserved.
//

import Foundation
import UIKit

extension UIDatePicker {
    
    func stringFromDate(format: String,date: Date) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: date)
    }
}
