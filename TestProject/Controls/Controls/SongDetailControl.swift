//
//  SongDetailControlViewController.swift
//  TestProject
//
//  Created by User on 08/01/18.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit
import  SDWebImage

class SongDetailControl: AbstractControl {
    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var artName: UILabel!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackId: UILabel!
    @IBOutlet weak var collcetionId: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Song Detail"
        setUI()
    }
    
    func setUI() -> Void {
    let songModel = model as! SongListDetail
    artImage.sd_setImage(with: songModel.artworkUrl60?.imageUrl(), placeholderImage: #imageLiteral(resourceName: "defaultImage"))
    artName.text = songModel.artistName
    categoryName.text = songModel.collectionName
    trackName.text = songModel.trackName
    trackId.text = String(describing: songModel.trackId!)
    collcetionId.text = String(describing: songModel.collectionId!)
    }
}
