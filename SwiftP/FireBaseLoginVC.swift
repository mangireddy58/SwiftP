//
//  FireBaseLoginVC.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 10/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Firebase

class FireBaseLoginVC: RootViewController, UITextFieldDelegate {

    @IBOutlet weak var emailIdTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginTapped(_ sender: Any) {
        guard let email = emailIdTxtFld.text,
        email != "",
        let password = passwordTxtFld.text,
        password != "" else {
            print("error")
        return
        }
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            guard error == nil else {
                print("Something went wrong")
                return
            }
            guard let user = user else { return }
            print(user.email ?? "missing email")
            print(user.displayName!)
            self.fnForFireBaseSignOutVC()
        })
        
        
    }

    @IBAction func gotoSignUp(_ sender: Any) {
        self.fnForFireBaseRegVC()
    }
}
