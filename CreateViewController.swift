//
//  CreateViewController.swift
//  Carousel
//
//  Created by Hana Kim on 9/20/14.
//  Copyright (c) 2014 Hana Kim. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var checkboxButton: UIButton!

    var isSelected:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func onTapBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTapCheckbox(sender: UIButton) {
        if (isSelected) {
            isSelected = false
            sender.selected = false
        } else {
            isSelected = true
            sender.selected = true
        }
        
    }
    
}
