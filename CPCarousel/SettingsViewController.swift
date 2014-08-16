//
//  SettingsViewController.swift
//  CPCarousel
//
//  Created by Daniel Eden on 15/08/2014.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onCloseButtonTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSignOutButtonTouch(sender: AnyObject) {
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var vc = storyboard.instantiateViewControllerWithIdentifier("RootView") as UIViewController
        
        UIApplication.sharedApplication().keyWindow.rootViewController = vc
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
