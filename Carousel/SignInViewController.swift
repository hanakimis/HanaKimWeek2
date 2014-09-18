//
//  SignInViewController.swift
//  Carousel
//
//  Created by Hana Kim on 9/18/14.
//  Copyright (c) 2014 Hana Kim. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        emailTextField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onTapSignInButton(sender: UIButton) {
        var signingInAlert = UIAlertView(title: "Signing in...", message: nil, delegate: nil, cancelButtonTitle: nil)
        
        if (emailTextField.text.isEmpty) {
            var emptyEmailAlert = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            emptyEmailAlert.show()
        } else if (!isValidEmail(emailTextField.text)) {
            var invalidEmailAlert = UIAlertView(title: "Email Invalid", message: "Please enter a valid email address", delegate: self, cancelButtonTitle: "OK")
            invalidEmailAlert.show()
        } else {
            
            signingInAlert.show()
            
            delay(2) {
                signingInAlert.dismissWithClickedButtonIndex(0, animated: true)

                if (self.passwordTextField.text == "password") && (self.emailTextField.text == "tim@codepath.com") {
                    // segue into next screen
                } else {
                    var invalidLoginAlert = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password", delegate: self, cancelButtonTitle: "OK")
                    invalidLoginAlert.show()
                }
                
            }
        }
        
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
