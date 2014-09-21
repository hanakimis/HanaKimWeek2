//
//  SettingsViewController.swift
//  Carousel
//
//  Created by Hana Kim on 9/20/14.
//  Copyright (c) 2014 Hana Kim. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTapButtonClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


    @IBAction func onTapButtonSignOut(sender: AnyObject) {
        
    }


}
