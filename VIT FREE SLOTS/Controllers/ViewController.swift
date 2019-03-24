//
//  ViewController.swift
//  VIT FREE SLOTS
//
//  Created by Devang Patel on 17/01/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
import Toast_Swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.makeToast("Logged in successfully")
    }
    
    @IBAction func Logout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            print("LogOut")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }
    
    @IBAction func ac(_ sender: UIButton) {
        performSegue(withIdentifier: "aca", sender: self)
    }
    
    @IBAction func ac1(_ sender: UIButton) {
        performSegue(withIdentifier: "aca", sender: self)
    }
}

