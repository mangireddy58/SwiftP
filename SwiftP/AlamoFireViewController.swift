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

class AlamoFireViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //        let url = NSURL(string: BASE_URL)
        //        let request = NSMutableURLRequest(url: url! as URL)
        //        request.httpMethod = "POST"
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let params:[String:Any] = ["CopropietarioID":71497]
//        let params = "{\"CopropietarioID\":71497}"
        Alamofire.request(BASE_URL, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
            if let data = response.data,
                let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
                let data = utf8Text.data(using: String.Encoding.utf8)
                    do {
                        let jsonDict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                        print("Dictionary: \(String(describing: jsonDict))")
//                        let pendingArray = jsonDict["listaNotification"] as? NSArray
//                        print("pendingArray\(String(describing: pendingArray))")
                    }catch {
                        print("Not converted to Dict")
                    }
                }
                
            }
    }
}
