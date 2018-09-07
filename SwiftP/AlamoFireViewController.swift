//
//  AlamoFireViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 04/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Alamofire

//prod
//let baseUrl = "http://54.169.243.5/MASService.svc/"
//dev
let devbaseUrl = "http://54.169.243.5:8080/MASService.svc/"

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
    
    
    
    
    
    @IBAction func loginBtnAction(_ sender: Any) {
        
    }
    
    // Downloading images using alamofire images
    /*let imageView = UIImageView(frame: frame)
    let url = URL(string: "https://httpbin.org/image/png")!
    let placeholderImage = UIImage(named: "placeholder")!
    
    imageView.af_setImage(withURL: url, placeholderImage: placeholderImage)*/
    
    //MARK:- Alamofire Testing
    func setServiceRequestToServer(service: String!, httpMethod: HTTPMethod, params: NSDictionary?,headers: HTTPHeaders?, completionHandler: @escaping ( _ response: AnyObject?,  _ error: String?) -> Void)
    {
        
//        if (Utility.sharedInstance.isConnectedToNetwork() == false) // check for internet connection
//        {
//            completionHandler(nil, Constants.Alert.titleNoConnection)
//            return
//        }
        
        let urlString = devbaseUrl + service //staging
//        print("URL : \(urlString)")
//        print("Parameters \(String(describing: params))")
        
        
        Alamofire.request(urlString, method: httpMethod, parameters: params as? Parameters, encoding: JSONEncoding.default, headers: nil).response
            { (response) in
                if (response.error == nil)
                {
                    self.extractDataFromResponse(response: response, completionHandler:
                        { (responseData, errorString) in
                            completionHandler(responseData, errorString)
                    })
                }
                else
                {
                    print(response.error!)
                }
        }
    }
    func extractDataFromResponse(response: DefaultDataResponse, completionHandler: @escaping ( _ response: AnyObject?,  _ error: String?) -> Void)
    {
        if ((response.data?.count)! > 0)
        {
            do{
                
//                let dataString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)
                
                let responseJSON = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments ) as! NSDictionary
                
                if let dataDictionary = responseJSON as? [String: Any]
                {
                    if (dataDictionary.count == 0)
                    {
                        completionHandler(responseJSON as AnyObject?, nil)
                    }
                    else
                    {
                        if let responseValue = dataDictionary["Response"] as? String
                        {
                            if(responseValue == "Fail")
                            {
                                completionHandler(dataDictionary as AnyObject?, nil)
                            }
                            else
                            {
                                completionHandler(dataDictionary as AnyObject?, nil)
                            }
                        }
                    }
                }
            }
            catch let error as NSError
            {
                completionHandler(nil, error.localizedDescription)
            }
        }
        else
        {
            completionHandler(nil, "No data found")
        }
        
    }
    
    
    
}
    

