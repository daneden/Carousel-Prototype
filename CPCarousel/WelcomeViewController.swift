//
//  WelcomeViewController.swift
//  CPCarousel
//
//  Created by Daniel Eden on 14/08/2014.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var welcomePageControl: UIPageControl!
    @IBOutlet weak var continueFrameView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var backupSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeScrollView.delegate = self
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = scrollView.contentOffset.x
        
        // Get the current page based on the scroll offset
        var page : Int = Int(round(offset / 320))
        
        // Set the current page, so the dots will update
        welcomePageControl.currentPage = page
    
        // Stage animation for the button that exits the welcome tutorial
        if (welcomePageControl.currentPage == 3) {
            // Reveal the view
            self.continueFrameView.hidden = false
            
            // Animate alpha to 1
            UIView.animateWithDuration(0.5, animations: {
                self.continueFrameView.alpha = 1
            })
        } else {
            // Animate alpha with a callback that hides the view
            UIView.animateWithDuration(0.5, delay: 0.0, options: nil, animations: {
                self.continueFrameView.alpha = 0
            }, completion: { (Bool) -> Void in
                self.continueFrameView.hidden = true
            })
        }
    }


    @IBAction func onContinueButtonTouch(sender: AnyObject) {
        if(backupSwitch.on == false) {
            var error = UIAlertView(title: "Enable backup to conitnue", message: "Carousel works best when automatic backup is enabled.", delegate: self, cancelButtonTitle: "OK")
            error.show()
        } else {
            performSegueWithIdentifier("welcomeToFeedSegue", sender: self)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
