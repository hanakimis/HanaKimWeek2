//
//  CreateViewController.swift
//  Carousel
//
//  Created by Hana Kim on 9/20/14.
//  Copyright (c) 2014 Hana Kim. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    
    @IBOutlet weak var helpTextImage: UIImageView!
    @IBOutlet weak var formBgImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var agreeToTermsButton: UIButton!
    @IBOutlet weak var createDropboxButton: UIButton!
    
    @IBOutlet weak var checkboxButton: UIButton!

    
    var isSelected:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            self.helpTextImage.frame.origin = CGPoint(x: 0, y: 0)
            self.formBgImage.frame.origin = CGPoint(x: 0, y: 53)
            self.firstNameTextField.frame.origin = CGPoint(x: 21, y: 70)
            self.lastNameTextField.frame.origin = CGPoint(x: 21, y: 108)
            self.emailTextField.frame.origin = CGPoint(x: 21, y: 151)
            self.passwordTextField.frame.origin = CGPoint(x: 21, y: 199)
            self.agreeToTermsButton.frame.origin = CGPoint(x: 21, y: 247)
            self.checkboxButton.frame.origin = CGPoint(x: 21, y: 253)
            self.createDropboxButton.frame.origin = CGPoint(x: 0, y: 290)
            }, completion: nil)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        var userInfo = notification.userInfo!
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
        var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
        var animationDuration = durationValue.doubleValue
        var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
        var animationCurve = curveValue.integerValue
        
        UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions.fromRaw(UInt(animationCurve << 16))!, animations: {
            self.helpTextImage.frame.origin = CGPoint(x: 0, y: 82)
            self.formBgImage.frame.origin = CGPoint(x: 0, y: 153)
            self.firstNameTextField.frame.origin = CGPoint(x: 21, y: 170)
            self.lastNameTextField.frame.origin = CGPoint(x: 21, y: 208)
            self.emailTextField.frame.origin = CGPoint(x: 21, y: 251)
            self.passwordTextField.frame.origin = CGPoint(x: 21, y: 299)
            self.agreeToTermsButton.frame.origin = CGPoint(x: 21, y: 347)
            self.checkboxButton.frame.origin = CGPoint(x: 21, y: 353)
            self.createDropboxButton.frame.origin = CGPoint(x: 0, y: 467)
            }, completion: nil)
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
    
    @IBAction func onPanView(sender: UIPanGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
