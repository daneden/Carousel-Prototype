//
//  SignInViewController.swift
//  CPCarousel
//
//  Created by Daniel Eden on 14/08/2014.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class SignInViewController: ViewController, UIScrollViewDelegate, UIAlertViewDelegate {

    @IBOutlet weak var signInButtonsView: UIView!
    @IBOutlet weak var signInFormScrollView: UIScrollView!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        signInFormScrollView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        emailTextField.becomeFirstResponder()
    }
    
    @IBAction func onBackButtonTouch(sender: AnyObject) {
        navigationController.popViewControllerAnimated(true)
    }
    
    @IBAction func onSignInButtonTouch(sender: AnyObject) {
        var credentialsError = UIAlertView(title: "Error", message: "Please sign in with your Dropbox email address and password", delegate: self, cancelButtonTitle: "OK")
        
        // Check non-nil values
        if(emailTextField.text == nil || passwordTextField.text == nil) {
            credentialsError.title = "Email and password required"
            credentialsError.show()
        } else {
            // Prepare loading alert
            var loadingView = UIAlertView()
            loadingView.title = "Signing in"
            
            // Show loading alert
            loadingView.show()
            
            // After a 2 second delay...
            delay(2, closure: {
                // Dismiss the loading alert
                loadingView.dismissWithClickedButtonIndex(0, animated: true)
                
                // If credentials are invalid...
                if (self.emailTextField.text != "dan.eden@me.com" || self.passwordTextField.text != "password") {
                    
                    // Show error
                    credentialsError.title = "Incorrect email or password"
                    credentialsError.show()
                    
                } else {
                    
                    // Segue to the welcome screens
                    self.performSegueWithIdentifier("signInSegue", sender: self)
                    
                }
            })
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        var userInfo = notification.userInfo
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size.height
        
        signInFormScrollView.transform = CGAffineTransformMakeTranslation(0, -90)
        signInButtonsView.transform = CGAffineTransformMakeTranslation(0, CGFloat(-kbSize+92))
    }
    
    func keyboardWillHide(notification: NSNotification) {
        signInFormScrollView.transform = CGAffineTransformMakeTranslation(0, 0)
        signInButtonsView.transform = CGAffineTransformMakeTranslation(0, 0)
    }

    func scrollViewDidScroll(scrollView: UIScrollView!) {
        view.endEditing(true)
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
