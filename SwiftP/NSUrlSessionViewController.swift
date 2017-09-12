//
//  NSUrlSessionViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 24/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

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
    
    @IBAction func NSurlSession(_sender:Any) {
        let myUrl = NSURL(string:"")
        let request = NSMutableURLRequest(url: myUrl! as URL)
        request.httpMethod = "POST"
        let postString = ""
        request.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
            if error != nil {
                print(error!)
                return
            }
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data:data!, encoding:String.Encoding.utf8.rawValue)
            print(responseString!)
            guard let httpBody = try? JSONSerialization.data(withJSONObject: responseString, options: []) else {
                return
            }
            
            
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    

}
