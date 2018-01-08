//
//  SongListCell.swift
//  TestProject
//
//  Created by User on 08/01/18.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

class SongListCell: AbstractTableCell {

    //SubViews
    var songName: UILabel = {
        let labelName = UILabel()
        labelName.backgroundColor = .red
        labelName.numberOfLines = 0
        labelName.lineBreakMode = .byWordWrapping
        labelName.text = "Nitesh Garg basjhdhj bajsbdajbs absdjkabsdba akjsdabsd kajsbdkabsd akjsdaks dakshjdksdkasd aksdhaksdhjakjs daskdhjakjsd asd"
        return labelName
    }()
    
    //Init Views
    override func initViews() {
        addSubview(songName)
        backgroundColor = .green
        layoutIfNeeded()
    }
    
    override func updateWithModel(_ model: AnyObject) {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        addVisualConstraints(["H:|[label]|","V:|-10-[label]-10-|"], subviews: ["label" : songName])
    }
}
