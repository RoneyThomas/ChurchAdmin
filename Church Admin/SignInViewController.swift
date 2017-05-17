//
//  SignInViewController.swift
//  Church Admin
//
//  Created by Roney Thomas on 2017-05-11.
//  Copyright © 2017 St. Mary's Malankara Orthodox Syrian Church. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseFacebookAuthUI

class SignInViewController: UIViewController, FUIAuthDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        checkLoggedIn()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkLoggedIn() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                // User is signed in.
                DispatchQueue.main.async() {
                    [unowned self] in
                    self.performSegue(withIdentifier: "signedInUser", sender: self)
                }
            } else {
                // No user is signed in.
                self.login()
                DispatchQueue.main.async() {
                    [unowned self] in
                    self.performSegue(withIdentifier: "signedInUser", sender: self)
                }
            }
        }
    }
    
    func login() {
        let authUI = FUIAuth.defaultAuthUI()
        let facebookProvider = FUIGoogleAuth()
        let googleProvider = FUIFacebookAuth()
        authUI?.delegate = self
        authUI?.providers = [googleProvider, facebookProvider]
        authUI?.isSignInWithEmailHidden = true
        let authViewController = authUI?.authViewController()
        self.present(authViewController!, animated: true, completion: nil)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if error != nil {
            //Problem signing in
            login()
            print("Not signed in")
        }else {
            //User is in! Here is where we code after signing in
            print("User is signed in")
        }
    }
}
