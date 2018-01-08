//
//  SongListControl.swift
//  TestProject
//
//  Created by User on 08/01/18.
//  Copyright © 2018 Nitesh. All rights reserved.
//

import UIKit
import KVSpinnerView

class SongListControl: AbstractTableListControl {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.noItemsText = "No data found..."
    }
    
    override var cellClass: AbstractTableCell.Type {
        return SongListCell.self
    }
    
    override var isNibUsed: Bool {
        return false
    }
    
    override func refresh() {
        super.refresh()
    }
    
    override func requestItems(_ query: NSString, limit: NSInteger, offset: NSInteger, completion: @escaping (_ : NSArray?, _ : NSError?, _ : Bool?) -> Void) {
        KVSpinnerView.show()
        UserStore.shared.getTableData(Url: DataURL, parameters: [:]) { (success, Data) in
            KVSpinnerView.dismiss()
            if success {
                return completion(Data as? NSArray, nil, false)
            }else {
               completion([], nil, false)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ =  ActionSongDetail(items[indexPath.row] as AnyObject)
    }
}
