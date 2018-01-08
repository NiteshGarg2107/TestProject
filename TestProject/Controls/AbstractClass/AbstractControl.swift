//
//  AbstractControl.swift
//  71829 ARTIE
//
//  Created by User on 20/12/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class AbstractControl: UIViewController,TableCellDelegate,UITextFieldDelegate {
    @IBOutlet var listContainer: UIView!
    
    class var control: AbstractControl {
        return UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: self)) as! AbstractControl
    }
    
    //Store Variable
    var model: AnyObject?
    
    class func controlWithModel(_ model: AnyObject) -> AbstractControl {
        let control = self.control
        control.model = model
        return control
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initListControl()
    }
    
    var hideNavigationBar: Bool {
        get {
            return (self.navigationController?.isNavigationBarHidden)!
        }
        set {
            self.navigationController?.isNavigationBarHidden = newValue
        }
    }
    
    func initListControl() {
        if listContainer != nil {
            if tableControl != nil {
                customAddChildViewController(tableControl, toSubview: listContainer)
            }
        }
    }
    
    //Table List
    var tableClass: AbstractTableListControl.Type! {
        return nil
    }
    var _tableControl: AbstractTableListControl!
    var tableControl: AbstractTableListControl! {
        if tableClass == nil {
            return nil
        }
        
        if _tableControl == nil {
            _tableControl = tableClass.init(style: .plain)
            _tableControl.listDelegate = self
            _tableControl.cellDelegate = self
        }
        
        return _tableControl
    }
    //Table Cell Delegate
    func didSelectCell() {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension AbstractControl: TableListDelegate{
    func updateCell() {
        print("Hello cell")
    }
    
    func updateModel(_ model: AnyObject, cell: AbstractTableCell) {
       print("cellClick")
    }
}

