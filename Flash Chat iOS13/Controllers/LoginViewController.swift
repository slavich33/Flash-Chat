//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var email: String = ""
    var password = ""
    var popUpWindow: PopUpWindow!

    @IBAction func loginPressed(_ sender: UIButton) {
       
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error?.localizedDescription {
                self.popUpWindow = PopUpWindow(title: "Error", text: e, buttontext: "OK")
                self.present(self.popUpWindow, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
        }
        }
    }
    
}
