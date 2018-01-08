//
//  SongsControl.swift
//  TestProject
//
//  Created by User on 08/01/18.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

class SongsControl: AbstractControl {
    
    override var tableClass: AbstractTableListControl.Type! {
        return SongListControl.self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
