//
//  newViewController.swift
//  VIT FREE SLOTS
//
//  Created by Devang Patel on 09/03/19.
//  Copyright © 2019 Devang Patel. All rights reserved.
//

import UIKit
import Firebase
class newViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Pass: UITextField!
    @IBOutlet weak var cPass: UITextField!
    @IBOutlet weak var load: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
       self.load.isHidden = true
    }
  
    
    @IBAction func addNew(_ sender: UIButton) {
        self.load.isHidden = false
        load.startAnimating()
        let email = Email.text
        let pass = Pass.text
        let cpass = cPass.text
        Auth.auth().createUser(withEmail: email!, password: pass!,completion: { user, error in
            if cpass == pass
            {
            if let firebaseError = error {
                print(firebaseError.localizedDescription)
                if email?.count == 0
                {
                    self.load.isHidden = true
                let alert = UIAlertController(title: "Email ID can't be empty", message: "Please fill again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                }
                if (pass?.count)! < 6
                {
                    self.load.isHidden = true
                    let alert = UIAlertController(title: "Password error", message: "Password must be at least of six character", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                else
                {
                    self.load.isHidden = true
                    let alert = UIAlertController(title: "Email ID not formatted correctly", message: "Please fill again", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                return
            }
            }
            else
            {
                self.load.isHidden = true
                let alert = UIAlertController(title: "Please confirm password again", message: "password with the confirm passowrd does not match", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            let homeView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(homeView, animated: true, completion: nil)
            print("Success!")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
