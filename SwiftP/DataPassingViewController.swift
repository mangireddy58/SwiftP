
//
//  DataPassingViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 15/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class DataPassingViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var firstNameTxtFld: UITextField!
    @IBOutlet weak var lastNameTxtFld: UITextField!
    @IBOutlet weak var fullNameTxtFld: UITextField!
    
    var dataPassArray :[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func nextVCBtnAction(_ sender: Any) {
        let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let dataReceive = storyBoard.instantiateViewController(withIdentifier: "DataReceiveViewController") as! DataReceiveViewController
        /* DataPassing as string
          dataReceive.firstNameStr = firstNameTxtFld.text as NSString!
          dataReceive.lastNameStr = lastNameTxtFld.text as NSString!
          dataReceive.fullNameStr = fullNameTxtFld.text as NSString!*/
        
        /* Data saving as UserDefaults
        let userDefaults = UserDefaults.standard
        userDefaults.set(firstNameTxtFld.text, forKey: "FirstName")
        userDefaults.set(lastNameTxtFld.text, forKey: "LastName")
        userDefaults.set(fullNameTxtFld.text, forKey: "FullName")
        userDefaults .synchronize()*/
        
        self.navigationController?.pushViewController(dataReceive, animated: true)
    }
  

}
