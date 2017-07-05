//
//  ServerCommunication.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 07/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Alamofire

protocol ClassForServerCommDelegate {
    func onServiceSuccess(responseDictionary : NSDictionary)
    func onServiceFailed()
}
class ServerCommunication: NSObject {
    
    var delegate : ClassForServerCommDelegate?
    func sendHttpPostRequestWithParam(parametersString : NSString, serviceName: NSString) -> Void {
//        let serviceUrl = NSString(format :"%@%@",BASE_URL,serviceName)
//        let data = parametersString.data(using: String.Encoding.utf8.rawValue)
//        let error:NSError
//        let parametersDictionary = JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue: 0))
        
        
    }
    
    //MARK:- ServerCommunication
    func sendPostParametersWithalamofire(parameterString:[String:Any], serviceName:String) -> Void {
        let serviceUrl = String(format: "%@%@", BASE_URL, serviceName)
        print("Service Url \(serviceUrl)")
        print("Parameters \(parameterString)")
        Alamofire.request(serviceUrl, method: .post, parameters: parameterString, encoding: JSONEncoding.default).responseJSON { response in
            if let data = response.data,
                let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
                let data = utf8Text.data(using: String.Encoding.utf8)
                do {
                    let jsonDict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                    print("Dictionary: \(String(describing: jsonDict))")
                    if ((self.delegate) != nil) {
                        self.delegate?.onServiceSuccess(responseDictionary : jsonDict as! NSDictionary)
                    }
                }catch {
                    print("Not converted to Dict")
                    if ((self.delegate) != nil) {
                        self.delegate? .onServiceFailed()
                    }
                }
            }
            else {
                print("No response")
                if ((self.delegate) != nil) {
                    self.delegate? .onServiceFailed()
                }
            }
        }
    }
    
    
    
    
}
//class SeverClass: ClassForServerCommDelegate {
//    internal func onServiceFailed() {
//        
//    }
//
//    internal func onServiceSuccess(responseDictionary: NSDictionary) {
//        
//    }
//}
//calling delegate method

//delegate?:onServiceFailed()
