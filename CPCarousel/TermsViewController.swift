//
//  TermsViewController.swift
//  CPCarousel
//
//  Created by Daniel Eden on 17/08/2014.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL(string: "https://www.dropbox.com/terms2014")
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    @IBAction func onCloseButtonTouch(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
