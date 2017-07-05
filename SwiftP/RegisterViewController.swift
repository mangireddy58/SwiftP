
//
//  RegisterViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 09/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import GoogleSignIn
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class RegisterViewController: RootViewController, GIDSignInDelegate, GIDSignInUIDelegate, UITextFieldDelegate {
    var parentNavigationController : UINavigationController?
    var dict : [String : AnyObject]!
    
    @IBOutlet weak var firstNameTxtFld: UITextField!
    @IBOutlet weak var lastNameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var reTypePasswordTxtFld: UITextField!
    @IBOutlet weak var dobTxtFld: UITextField!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var feMalebtn: UIButton!
    @IBOutlet weak var gPlusBtn: UIButton!
    @IBOutlet weak var fbBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    var genderStr:NSString!
    @IBOutlet weak var genderLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance().shouldFetchBasicProfile = true
        GIDSignIn.sharedInstance().clientID = "232661207175-19s0gkvgac5aptioi4bbks82c74rp78m.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().scopes = ["profile", "email"]
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    @IBAction func gPlusBtnAction(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        GIDSignIn.sharedInstance().signIn()
    }
    public func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            
            print(userId!,idToken!,fullName!,givenName!,familyName!,email!)
        } else {
            print("\(error.localizedDescription)")
        }
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!,
                withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
   
    @IBAction func faceBookLoginBtnAction(_ sender: Any) {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email")) {
//                        self.getFBUserData()
                        if((FBSDKAccessToken.current()) != nil){
                            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                                if (error == nil){
                                    self.dict = result as! [String : AnyObject]
                                    print(result!)
                                    print(self.dict)
                                }
                            })
                        }   
                    }
                }
            }
        }
    }
   /* func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }*/
    @IBAction func registerBtnAction(_ sender: Any) {
        if firstNameTxtFld.text?.characters.count == 0 {
            firstNameTxtFld.becomeFirstResponder()
        }
        else if lastNameTxtFld.text?.characters.count == 0 {
            lastNameTxtFld.becomeFirstResponder()
        }
        else if emailTxtFld.text?.characters.count == 0 {
            emailTxtFld.becomeFirstResponder()
        }
        else if passwordTxtFld.text?.characters.count == 0 {
            passwordTxtFld .becomeFirstResponder()
        }
        else if reTypePasswordTxtFld.text?.characters.count == 0 {
            reTypePasswordTxtFld.becomeFirstResponder()
        }
        else if dobTxtFld.text?.characters.count == 0 {
            dobTxtFld.becomeFirstResponder()
        }
        else if !validEmailId(inputText: emailTxtFld.text!) {
            let alertController = UIAlertController(title: "Attention!", message: "Please enter a valid emailid", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
                
            })
            alertController.addAction(ok)
            present(alertController, animated: true, completion: nil)
        }
        else if (passwordTxtFld.text?.characters.count)! < kPasswordCharacterMinLimit || (passwordTxtFld.text?.characters.count)! > kPasswordCharacterMaxLimit {
            let alertController = UIAlertController(title: "Attention!", message: "The password must be at least 6 characters and a maximum of 16.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
                
            })
            alertController.addAction(ok)
            present(alertController, animated: true, completion: nil)
        }
        else if passwordTxtFld.text != reTypePasswordTxtFld.text {
            let alertController = UIAlertController(title: "Attention!", message: "Password mismatch", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: { (alert) in
                
            })
            alertController.addAction(ok)
            present(alertController, animated: true, completion: nil)
        }
        else {
            print("Registred successfully")
        }
    }
    
    @IBAction func genderBtnAction(_ sender: UIButton) {
        if maleBtn.tag == 100 {
            maleBtn.setBackgroundImage(UIImage(named:"2.png"), for: UIControlState.normal)
            feMalebtn.setBackgroundImage(UIImage(named:"1.png"), for: UIControlState.normal)
            maleBtn.tag = 101
        }
        else {
            self.feMalebtn.setBackgroundImage(UIImage(named:"2.png"), for: UIControlState.normal)
            self.maleBtn.setBackgroundImage(UIImage(named:"1.png"), for: UIControlState.normal)
            maleBtn.tag = 100
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text?.characters.count)! >= kPasswordCharacterMaxLimit && (textField.tag == 4) {
            let oldLength = textField.text?.characters.count
            let replacementLength = string.characters.count
            let rangeLength = range.length
            let newLength = oldLength! - rangeLength + replacementLength
//            let returnKey = string.range(of: "\n").!= NSNotFound
            return newLength <= kPasswordCharacterMaxLimit
        }
        else if textField.tag == 6 {
           print("paswsord")
        }
        
        return true
    }
    
}
 
