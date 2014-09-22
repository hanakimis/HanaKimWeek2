//
//  IntroViewController.swift
//  Carousel
//
//  Created by Hana Kim on 9/18/14.
//  Copyright (c) 2014 Hana Kim. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var introImageBackground: UIImageView!
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = introImageBackground.frame.size
        scrollView.delegate = self
        scrollView.sendSubviewToBack(introImageBackground)
        
        doTheOffset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func scrollViewDidScroll(scrollView: UIScrollView) {
        doTheOffset()
    }
    
    func doTheOffset() {
        var offset = Float(scrollView.contentOffset.y)
        
        var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
        var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
        var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
        var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max: 0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max: 0)
        var scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1, r2Max: 1)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max: 0)
        
        tile1View.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
        
        tile1View.transform = CGAffineTransformScale(tile1View.transform,CGFloat(scale), CGFloat(scale))
        
        tile1View.transform = CGAffineTransformRotate(tile1View.transform, CGFloat(Double(rotation) * M_PI / 180))
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }

}
