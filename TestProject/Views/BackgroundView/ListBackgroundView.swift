//
//  ListBackgroundView.swift
//  Rewire
//
//  Created by Lakhwinder Singh on 17/11/16.
//
//

import UIKit
let semiBoldFontname = "AvenirLTStd-Heavy_1"
class ListBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initViews()
    }
    
    func initViews() {
        self.backgroundColor = UIColor.clear
        self.addSubview(self.messageLabel)
    }
    
    // MARK: Getters and Setters
    
    var messageText: String {
        get {
            return self.messageLabel.text!
        }
        set {
            self.messageLabel.text = newValue
        }
    }

    var _messageLabel: UILabel?
    var messageLabel: UILabel {
        get {
            if (_messageLabel == nil) {
                _messageLabel = UILabel()
                _messageLabel?.textColor = UIColor.lightGray
                _messageLabel?.font = UIFont(name: semiBoldFontname, size: 25)
                _messageLabel?.textAlignment = .center
            }
            return _messageLabel!
        }
        set {
            _messageLabel = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addVisualConstraints(["V:|[message]|", "H:|[message]|"], subviews: ["message": self.messageLabel])
    }

}


