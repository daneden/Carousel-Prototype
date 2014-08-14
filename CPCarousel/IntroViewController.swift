//
//  IntroViewController.swift
//  CPCarousel
//
//  Created by Daniel Eden on 13/08/2014.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tile1ImageView: UIImageView!
    @IBOutlet weak var tile2ImageView: UIImageView!
    @IBOutlet weak var tile3ImageView: UIImageView!
    @IBOutlet weak var tile4ImageView: UIImageView!
    @IBOutlet weak var tile5ImageView: UIImageView!
    @IBOutlet weak var tile6ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Rotations: -10 to 10
    // Size: 1.7 to 1
    // Distance: 500 to 285
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        println("\(scrollView.contentOffset)")
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
