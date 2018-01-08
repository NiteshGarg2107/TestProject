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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initListControl()
        // Do any additional setup after loading the view.
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
        
    }
    
    func updateModel(_ model: AnyObject, cell: AbstractTableCell) {
        
    }
}

extension AbstractControl {
    override func viewDidAppear(_ animated: Bool) {
    }
}

