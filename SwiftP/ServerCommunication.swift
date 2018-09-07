//
//  ServerCommunication.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 07/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Alamofire
import AFNetworking

protocol ClassForServerCommDelegate {
    func onServiceSuccess(responseDictionary : NSDictionary)
    func onServiceFailed()
}
class ServerCommunication: NSObject {
    
    var delegate : ClassForServerCommDelegate?
    
    func sendHttpPostRequestWithParam(parametersString : String, serviceName: String) -> Void {
        let serviceUrl = "\(BASE_URL)\(serviceName)"
        let data: Data? = parametersString.data(using: String.Encoding.utf8)
        let parametersDictionary = try? JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
        print("\(String(describing: parametersDictionary))")
        let manager = AFHTTPSessionManager(sessionConfiguration: URLSessionConfiguration.default)
        manager.requestSerializer.timeoutInterval = 30//Constants.serviceTimeOut.service_Time_Out
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Content-Type")
        manager.requestSerializer.setValue("application/json", forHTTPHeaderField: "Accept")
        manager.post(serviceUrl, parameters: parametersDictionary as? NSDictionary, progress: nil, success: {(_ task: URLSessionDataTask, _ responseObject: Any?) -> Void in
            if ((self.delegate) != nil) {
                self.delegate?.onServiceSuccess(responseDictionary : responseObject as! NSDictionary)
            }
        }, failure: {(operation: URLSessionDataTask?, error: Error) in
            let error = Error.self
            print("Failed: \(String(describing: error))")
            if ((self.delegate) != nil) {
                self.delegate? .onServiceFailed()
            }
        })
    }
    
    //MARK:- ServerCommunication
    func sendPostParametersWithalamofire(parameterString:[String:Any], serviceName:NSString) -> Void {
        let serviceUrl = "\(BASE_URL)\(serviceName)"
        Alamofire.request(serviceUrl, method: .post, parameters: [:], encoding: JSONEncoding.default)
            .responseJSON { response in
                debugPrint(response)
                if (response.error == nil) {
                    if let value = response.result.value {
                        if ((self.delegate) != nil) {
                            self.delegate?.onServiceSuccess(responseDictionary : value as! NSDictionary)
                        }
                    }
                }
                else {
                    print(response.result.error!)
                    if ((self.delegate) != nil) {
                        self.delegate? .onServiceFailed()
                    }
                }
        }
    }
    
    //MARK:- Normal Json Parsing
    func sendPostParametersWithNSUrlSession(parameterString : String, serviceName : String)-> Void {
        let urlStr = "\(BASE_URL)\(serviceName)"
        let jsonString = String(format: "%@", parameterString)
        let jsonData = jsonString.data(using:.utf8)
        var request = URLRequest(url: URL(string: urlStr)!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(30)
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) {(data , response, error) in
            if(error != nil){
                print("Error \(String(describing: error))")
                if ((self.delegate) != nil) {
                    self.delegate? .onServiceFailed()
                }
            }
            else {
                do {
                    let fetchedDataDictionary = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    print(fetchedDataDictionary!)
                    if ((self.delegate) != nil) {
                        self.delegate?.onServiceSuccess(responseDictionary : fetchedDataDictionary!)
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

