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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomeScrollView.delegate = self
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = scrollView.contentOffset.x
        
        // Set the page indicator
        if((offset >= 0 && offset < 320) || offset < 0) {
            welcomePageControl.currentPage = 0
        } else if (offset >= 320 && offset < 640 ) {
            welcomePageControl.currentPage = 1
        } else if (offset >= 640 && offset < 960) {
            welcomePageControl.currentPage = 2
        } else if ((offset >= 960 && offset < 1280) || offset >= 1280) {
            welcomePageControl.currentPage = 3
        }
    
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
