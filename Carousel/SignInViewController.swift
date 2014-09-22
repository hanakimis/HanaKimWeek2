//
//  SignInViewController.swift
//  Carousel
//
//  Created by Hana Kim on 9/18/14.
//  Copyright (c) 2014 Hana Kim. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginTextImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var loginFormImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //emailTextField.delegate = self
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        let textOffset = 0 - loginTextImage.frame.height
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            self.loginFormImage.frame.offset(dx: 0, dy: textOffset)
            self.loginTextImage.frame.offset(dx: 0, dy: textOffset)
            self.emailTextField.frame.offset(dx: 0, dy: textOffset)
            self.passwordTextField.frame.offset(dx:0, dy: textOffset)
            self.signInButton.frame.offset(dx: 0, dy: textOffset)
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        UIView.animateWithDuration(1.5) {
            self.loginFormImage.frame.offset(dx: 0, dy: 100)
            self.loginTextImage.frame.offset(dx: 0, dy: 100)
            self.emailTextField.frame.offset(dx: 0, dy: 100)
            self.passwordTextField.frame.offset(dx:0, dy: 100)
            self.signInButton.frame.offset(dx: 0, dy: 100)
        }
    }
    

    @IBAction func onTapBackButton(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
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
                    self.performSegueWithIdentifier("signInTutorial", sender: self)
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        println("Memory Warning")
    }

}
