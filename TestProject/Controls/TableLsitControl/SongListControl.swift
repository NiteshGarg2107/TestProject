//
//  SongListControl.swift
//  TestProject
//
//  Created by User on 08/01/18.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit

class SongListControl: AbstractTableListControl {
    
    
    var listData: [Any]? = ["wed","asdfasd","sdfasdfs","asdasdas","asdasdas","asdasdasd"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var cellClass: AbstractTableCell.Type {
        return SongListCell.self
    }
    
    override var isNibUsed: Bool {
        return false
    }
    override func refresh() {
        //        needRefresh = true
        super.refresh()
    }
    override func requestItems(_ query: NSString, limit: NSInteger, offset: NSInteger, completion: @escaping (_ : NSArray?, _ : NSError?, _ : Bool?) -> Void) {
        return completion(listData as NSArray?, nil, false)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        _ =  ActionModelDetail()
    }
    

}
