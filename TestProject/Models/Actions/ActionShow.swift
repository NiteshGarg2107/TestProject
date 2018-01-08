//
//  ActionShow.swift


import UIKit
/*
 ActionShow to handle navigation/present for any actions.
 */
class ActionShow {

    //MARK:- Initializer functions
    init() {
        showControl()
    }
    
    //MARK:- Override in child controls if navigate not required
    func showControl() {
        navigate(control)
    }
    
    //MARK:- Must override in child controls to pass control to show
    var control: AbstractControl! {
        return nil
    }
    
    //MARK:- Navigate to control
    func navigate(_ newControl: AbstractControl) {
        if UIApplication.visibleViewController.className != newControl.className {
            UIApplication.visibleNavigationController.pushViewController(newControl, animated: true)
        }
    }
}

///////////////////////////////////////////////////////////////////////////////////////////
class ActionSongDetail: ActionShow {
    //Store Variable
    var songDetail: AnyObject!
    
    //MARK:- Override init for user
    init(_ details: AnyObject) {
        self.songDetail = details
        super.init()
    }
    
    
    override var control: AbstractControl! {
        return SongDetailControl.controlWithModel(songDetail)
    }
}






