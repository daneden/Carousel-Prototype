//
//  IntroViewController.swift
//  CPCarousel
//
//  Created by Daniel Eden on 13/08/2014.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    // Create outlets for the image tiles
    @IBOutlet weak var tile1ImageView: UIImageView!
    @IBOutlet weak var tile2ImageView: UIImageView!
    @IBOutlet weak var tile3ImageView: UIImageView!
    @IBOutlet weak var tile4ImageView: UIImageView!
    @IBOutlet weak var tile5ImageView: UIImageView!
    @IBOutlet weak var tile6ImageView: UIImageView!
    
    // Prepare an array for the image views
    var tiles: [UIImageView] = []
    
    // Create outlet for the scrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Create arrays for transformation coordinates, scale, and rotation
    var yOffsets : [Float] = [-285, -240, -430, -408, -520, -500]
    var xOffsets : [Float] = [-70, 45, 36, 90, -130, -75]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialise the tiles array
        tiles = [tile1ImageView, tile2ImageView, tile3ImageView, tile4ImageView, tile5ImageView, tile6ImageView]

        scrollView.delegate = self;
        
        // First-run transformations
        transformTiles(0)
    }
    
    // Transformation method
    func transformTiles(offset: Float) {
        
        // Prevent out-of-bounds transformations
        var localOffset = offset
        if(localOffset > 568) {
            localOffset = 568
        } else if (localOffset < 0) {
            localOffset = 0
        }
        
        for tile in enumerate(tiles) {
            // Transform coordinates
            var tx = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: xOffsets[tile.index], r2Max: 0)
            var ty = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: yOffsets[tile.index], r2Max: 0)
            
            // Scale
            var scale = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: scales[tile.index], r2Max: 1)
            
            // Rotation
            var rotation = convertValue(localOffset, r1Min: 0, r1Max: 568, r2Min: rotations[tile.index], r2Max: 0)
            
            tile.element.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
            tile.element.transform = CGAffineTransformScale(tile.element.transform, CGFloat(scale), CGFloat(scale))
            tile.element.transform = CGAffineTransformRotate(tile.element.transform, CGFloat(Double(rotation) * M_PI / 180.0))
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = Float(scrollView.contentOffset.y)
        
        // Transform tiles on scroll
        transformTiles(offset)
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
