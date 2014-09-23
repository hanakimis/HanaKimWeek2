//
//  TermsViewController.swift
//  Carousel
//
//  Created by Hana Kim on 9/22/14.
//  Copyright (c) 2014 Hana Kim. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://www.dropbox.com/terms?mobile=1")
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        
    }

    @IBAction func onTapCloseButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
