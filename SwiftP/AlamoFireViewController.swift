//
//  AlamoFireViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 04/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AlamoFireViewController: RootViewController {

    @IBOutlet weak var userNameTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userNameTxtFld.text = "demo5gauri@gmail.com"
        passwordTxtFld.text = "123456"
        //        let url = NSURL(string: BASE_URL)
        //        let request = NSMutableURLRequest(url: url! as URL)
        //        request.httpMethod = "POST"
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//        let params:Parameters = ["CopropietarioID":71497]
//        let params = "{\"CopropietarioID\":71497}"
//        Alamofire.request(BASE_URL, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//            if let data = response.data,
//                let utf8Text = String(data: data, encoding: .utf8) {
////                print("Data: \(utf8Text)") // original server data as UTF8 string
//                let data = utf8Text.data(using: String.Encoding.utf8)
//                    do {
//                        let jsonDict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
//                        print("Dictionary: \(String(describing: jsonDict))")
////                        let pendingArray = jsonDict["listaNotification"] as? NSArray
////                        print("pendingArray\(String(describing: pendingArray))")
//                    }catch {
//                        print("Not converted to Dict")
//                    }
//                }
        
            }
    
    
//    func alamofire() {
////        @"{\"user\": {\"email\": \"%@\",\"password\": \"%@\"},\"userPersonalDetails\": {\"iosId\":\"%@\"}}"
//        let parametersString:String = "[\"user\": [\"email\": \"%@\",\"password\": \"%@\"],\"userPersonalDetails\": [\"iosId\":\"%@\"]]"
//        let userName = self.userNameTxtFld.text
//        let password = self.passwordTxtFld.text
//        let string:String = String(format: "%@%@%@",parametersString, userName!,password!)
//        
//        let serverCommObj = ServerCommunication()
//        serverCommObj.delegate = self as? ClassForServerCommDelegate
//        print("",string)
//        serverCommObj .sendPostParametersWithalamofire(parameterString: string, serviceName: BASE_URL as String)
//        
//        }
    
    
    
    @IBAction func loginBtnAction(_ sender: Any) {
//        self.alamofire()
    }
    

}
    

