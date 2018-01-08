//
//  SongListCell.swift
//  TestProject
//
//  Created by User on 08/01/18.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit
import SDWebImage

class SongListCell: AbstractTableCell {

    //SubViews
    var songArtistName: UILabel = {
        let labelName = UILabel()
        labelName.numberOfLines = 0
        labelName.lineBreakMode = .byWordWrapping
        return labelName
    }()
    
    var collectionName: UILabel = {
        let labelName = UILabel()
        labelName.numberOfLines = 0
        labelName.lineBreakMode = .byWordWrapping
        return labelName
    }()
    
    var userImage: UIImageView = {
       let imageView = UIImageView()
       imageView.clipsToBounds = true
       imageView.layer.cornerRadius = 20
       imageView.contentMode = .scaleAspectFit
       return imageView
    }()
    
    
    //Init Views
    override func initViews() {
        addSubviews([songArtistName,collectionName,userImage])
        layoutIfNeeded()
    }
    
    override func updateWithModel(_ model: AnyObject) {
    let songModel = model as! SongListDetail
    songArtistName.text = songModel.artistName
    collectionName.text = songModel.collectionName
    userImage.sd_setImage(with:  songModel.artworkUrl30!.imageUrl(), placeholderImage: #imageLiteral(resourceName: "defaultImage"))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        addVisualConstraints(["H:|-[imageView(40)]-10-[label]-10-|","H:|-[imageView(40)]-10-[collectionLable]-10-|","V:|-10-[label]-5-[collectionLable]-10-|","V:|-[imageView(40)]"], subviews: ["label" : songArtistName,"collectionLable": collectionName,"imageView": userImage])
    }
}
