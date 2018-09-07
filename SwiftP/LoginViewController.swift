//
//  LoginViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 07/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit


class LoginViewController: RootViewController, UITextFieldDelegate {
var parentNavigationController : UINavigationController?
    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View")
    }
    
    @IBAction func submitAction(_ sender: Any) {
        fnForFireBaseRegVC()
        
//        if userNameTxtFld.text == "" {
//            userNameTxtFld.becomeFirstResponder()
//        }
//        else if passwordTxtFld.text == "" {
//            passwordTxtFld.becomeFirstResponder()
//        }
//        else if !validEmailId(inputText: userNameTxtFld.text!)  {
//            print("Not Valid Emaild")
//        }
//        else {
////            let loginParams:[String:Any] = String(format: LOGIN_PARAMETERS, self.userNameTxtFld.text!, self.passwordTxtFld.text!)
//            let deviceId = "wrwer34fr436tr4fgt54gtrtg56yhgtrhy65h65"
//            let loginParams = String(format: LOGIN_PARAMETERS, userNameTxtFld.text!, passwordTxtFld.text!, deviceId)
//            let serverCommObj = ServerCommunication()
//            serverCommObj.delegate = self
//            print("",loginParams)
            //serverCommObj .sendPostParametersWithalamofire(parameterString: loginParams, serviceName: LOGIN_SERVICE_NAME)
            
        /*let url = "https://restcountries.eu/rest/v1/all"
            let serviceUrl = ""
            let urlStr = String(format: "%@%@",url, serviceUrl)
            let jsonString = String(format: "%@%@", userNameTxtFld.text!,passwordTxtFld.text!)
            let jsonData = jsonString .data(using: String.Encoding.utf8)
            var request = URLRequest(url: URL(string: urlStr)!)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            let configuration = URLSessionConfiguration.default
            let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) {(data , response, error) in
                if(error != nil){
                    print("Error")
                }
                else {
                    do {
                        let fetchedDataArray = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                        print(fetchedDataArray)
                    }
                    catch {
             
                    }
                }
            }
            task.resume()*/
            
        }
    func onServiceSuccess(responseDictionary: NSDictionary) {
        
    }
    func onServiceFailed() {
        
    }
    
    
    
    
    
    
    
    
    
}
