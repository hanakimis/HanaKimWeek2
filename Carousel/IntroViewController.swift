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
    
    var introTiles: [UIImageView]!
    var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [Float] = [-355, -240, -415, -408, -480, -500]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [Float] = [-10, -10, 10, 10, 10, -10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = introImageBackground.frame.size
        scrollView.delegate = self
        scrollView.sendSubviewToBack(introImageBackground)
        
        introTiles = [tile1View, tile2View, tile3View, tile4View, tile5View, tile6View]
        
        tile3View.alpha = 0
        tile4View.alpha = 0
        tile5View.alpha = 0
        tile6View.alpha = 0
        
        doTheOffset()
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        doTheOffset()
    }
    
    func doTheOffset() {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx : Float
        var ty : Float
        var scale : Float
        var rotation : Float
        
        for i in 0...5 {
        
            tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: xOffsets[i], r2Max: 0)
            ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: yOffsets[i], r2Max: 0)
            scale = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: scales[i], r2Max: scales[i])
            rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: rotations[i], r2Max: 0)
        
            introTiles[i].transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
            introTiles[i].transform = CGAffineTransformScale(introTiles[i].transform,CGFloat(scale), CGFloat(scale))
            introTiles[i].transform = CGAffineTransformRotate(introTiles[i].transform, CGFloat(Double(rotation) * M_PI / 180))
        }
        
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
