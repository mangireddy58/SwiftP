//
//  NSUrlSessionViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 24/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

let NOTIFICATION_PARAMS = "{\"Email\":\"%@\",\"Password\":\"%@\",\"IMEI\":\"%@\"}"
let BASE_URL = "http://54.169.243.5/MASService.svc/"
let NOTIFICATION_URL = "AuthenticateEmployee"

class NSUrlSessionViewController: UIViewController {

    var BASE_URL = "https://jsonplaceholder.typicode.com/"
    var SERVICE_NAME_URL = "posts"
    var LOGIN_PARAMETERS1 = "{\"username\": \"%@\",\"tweet\": \"%@\"}"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func getAction(_ sender: Any) {
        guard let serviceUrl = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        let session = URLSession.shared
        session.dataTask(with: serviceUrl) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }
            }.resume()
    }
    @IBAction func postAction(_ sender: Any) {
        let Url = String(format: "%@%@", BASE_URL, SERVICE_NAME_URL)
        guard let serviceUrl = URL(string: Url) else { return }
        //        let loginParams = String(format: LOGIN_PARAMETERS1, "test", "Hi World")
        let parameterDictionary = ["username" : "@kilo_laco", "tweet" : "Hi World"]
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
            return
        }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                }catch {
                    print(error)
                }
            }
            }.resume()
        
        
    }
    // Working code
    @IBAction func NSurlSession(_sender:Any) {
        let deviceUdid = UIDevice.current.identifierForVendor!.uuidString
        let urlStr = String(format: "%@%@",BASE_URL, NOTIFICATION_URL)
        let jsonString = String(format:NOTIFICATION_PARAMS, emailTxtFld.text!, passwordTxtFld.text!,deviceUdid )
        print("\(urlStr)\(jsonString)")
        let jsonData = jsonString.data(using:.utf8)
        var request = URLRequest(url: URL(string: urlStr)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) {(data , response, error) in
            if(error != nil){
                print("Error \(String(describing: error))")
            }
            else {
                do {
                    let fetchedDataDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    print(fetchedDataDictionary!)
                    let message = fetchedDataDictionary?["ResponseMsg"] as! String
                    if message == "Login not allowed. This device is not registered. Contact Admin." {
                        print(message)
                        //                        self.showUniversalAlert(title: "", message: message)
                    }
                    else {
                        //                        self.dataArray = (fetchedDataDictionary?["data"] as! NSArray)
                        //                        self.annoucementTableView.dataSource = self
                        //                        self.annoucementTableView.delegate = self
                        //                        self.annoucementTableView .reloadData()
                    }
                }
                catch let error as NSError {
                    print(error.debugDescription)
                }
            }
        }
        task.resume()
    }
    
    
    
    
    
    
    
    

}
