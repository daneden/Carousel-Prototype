//
//  SignUpViewController.swift
//  CPCarousel
//
//  Created by Daniel Eden on 14/08/2014.
//  Copyright (c) 2014 Daniel Eden. All rights reserved.
//

import UIKit

class SignUpViewController: ViewController, UIScrollViewDelegate, UIAlertViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var signUpButtonsView: UIView!
    @IBOutlet weak var signUpFormScrollView: UIScrollView!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var termsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register keyboard events
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        signUpFormScrollView.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    @IBAction func onBackButtonTouch(sender: AnyObject) {
        navigationController.popViewControllerAnimated(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        if(firstNameTextField.isFirstResponder()) {
            lastNameTextField.becomeFirstResponder()
        } else if(lastNameTextField.isFirstResponder()) {
            emailTextField.becomeFirstResponder()
        } else if(emailTextField.isFirstResponder()) {
            passwordTextField.becomeFirstResponder()
        } else {
            passwordTextField.resignFirstResponder()
        }
        
        // Make sure line breaks can't be entered
        return false
    }
    
    @IBAction func onTermsButtonTouch(sender: AnyObject) {
        if(termsButton.selected) {
            termsButton.selected = false
        } else {
            termsButton.selected = true
        }
    }
    
    @IBAction func onSignUpButtonTouch(sender: AnyObject) {
        var credentialsError = UIAlertView(title: "Error", message: "Please provide your name, email address, and a secure password to sign up", delegate: self, cancelButtonTitle: "OK")
        
        // Check non-nil values
        if(firstNameTextField.text == "" || lastNameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "") {
            credentialsError.show()
        } else {
            if(termsButton.selected == false) {
                credentialsError.title = "Accept terms to continue"
                credentialsError.message = nil
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
                    
                    // Segue to the welcome screens
                    self.performSegueWithIdentifier("signUpSegue", sender: self)
                })
            }
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        var userInfo = notification.userInfo
        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation
        var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size.height
        
        signUpFormScrollView.transform = CGAffineTransformMakeTranslation(0, -110)
        signUpButtonsView.transform = CGAffineTransformMakeTranslation(0, CGFloat(-kbSize+110))
    }
    
    func keyboardWillHide(notification: NSNotification) {
        signUpFormScrollView.transform = CGAffineTransformMakeTranslation(0, 0)
        signUpButtonsView.transform = CGAffineTransformMakeTranslation(0, 0)
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
