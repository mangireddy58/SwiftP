//
//  FireBaseRegVC.swift
//  
//
//  Created by Rushikesh Kulkarni on 10/08/17.
//
//

import UIKit
import Firebase

class FireBaseRegVC: RootViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var emailIdTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         You tube video url 
//        https://youtu.be/TN8dlspR1P0
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        if userNameTxtFld.text == "" {
            userNameTxtFld .becomeFirstResponder()
        }
        else if emailIdTxtFld.text == "" {
            emailIdTxtFld.becomeFirstResponder()
        }
        else if passwordTxtFld.text == "" {
            passwordTxtFld.becomeFirstResponder()
        }
        else {
           FIRAuth.auth()?.createUser(withEmail: emailIdTxtFld.text!, password: passwordTxtFld.text!, completion: { (user, error) in
            guard error == nil else {
                let alert = UIAlertController(title: "Something went wrong", message: error?.localizedDescription, preferredStyle:.alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                    
                })
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                return
            }
            guard let user = user else { return }
            print(user.email ?? "missing email")
            print(user.uid)
            
            let changeRequest = user.profileChangeRequest()
            changeRequest.displayName = self.userNameTxtFld.text
            changeRequest.commitChanges(completion: { (error) in
                self.fnForFireBaseSignOutVC()
            })
            
            
           })
        }
            
    }
    
    
    @IBAction func gotoLoginVC(_ sender: Any) {
        self.fnForFireBaseLoginVC()
    }
    
    
}
