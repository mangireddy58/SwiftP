//
//  CollectionDemoController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 14/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class CollectionDemoController: RootViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var parentNavigationController : UINavigationController?
    @IBOutlet weak var collectionDemoView: UICollectionView!
    var responseArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.isConnectedToNetwork() == false {
            print("No internet connection please check")
        }
        else {
            parseData()
        }
        
//        self.addProgressIndicator()
//        self.hideProgressIndicator()
    }
    func parseData() {
        self.showProgressIndicator()
        self.fnForShowProgressHud(hudStatus: "Getting data...")
        //Post
/*      let configuration = URLSessionConfiguration .default
        let session = URLSession(configuration: configuration)
        
        let params = "{\"CopropietarioID\":71497}"
        
        let urlString = NSString(format: "http://bunker360v3.cloudapp.net/JsonService.svc/GetListaNotifications");
        print("url string is \(urlString)")
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: NSString(format: "%@", urlString)as String) as URL?
        request.httpMethod = "POST"
        request.timeoutInterval = 60
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody  = params.data(using: String.Encoding.utf8)
        
        let dataTask = session.dataTask(with: request as URLRequest) {data,response,error in
            let httpResponse = response as? HTTPURLResponse
            if (error != nil) {
                print(error!)
            } else {
                if let responseJSON = (try? JSONSerialization.jsonObject(with: data!, options: [])) as? [String:AnyObject]{
                    print("json response is \(responseJSON)")
                    let pendingArray = responseJSON["listaNotification"] as? NSArray
                    print("pendingArray\(String(describing: pendingArray))")

                    if let success_response:String = responseJSON["Response"] as? String {
                        if success_response == "Success" {
                            print("Success")
                        }
                        else{
                            print("error")
                        }
                    }
                }
                print(httpResponse!)
            }
            
            DispatchQueue.main.async {
                //Update your UI here
            }
            
        }
        dataTask.resume()*/
        
        
        
//        Get
                let url = "https://restcountries.eu/rest/v1/all"
                var request = URLRequest(url: URL(string: url)!)
                request.httpMethod = "GET"
                let configuration = URLSessionConfiguration.default
                let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
                let task = session.dataTask(with: request) {(data , response, error) in
        
                    if(error != nil){
                        print("Error")
                    }
                    else {
                        do {
                            self.responseArray = NSMutableArray(array:try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray)
                            print(self.responseArray)
                            self.collectionDemoView.reloadData()
        //                    self.responseArray = fetchedDataArray .value(forKey: "name") as! NSArray
        //                    print(self.responseArray)
        //                    for eachFetchedCountry in fetchedDataArray {
        //                        let eachCountry = eachFetchedCountry as! [String: Any]
        //                        print(eachCountry)
        //                        let countryNameArray = eachCountry["name"] as! NSMutableArray
        //                        let capitalNameArray = eachCountry["capital"] as! NSMutableArray
        //                        print(countryNameArray, capitalNameArray)
        //
        //                    }//for ending
                            self.collectionDemoView.dataSource = self
                            self.collectionDemoView.delegate = self
                            
                            self.collectionDemoView.reloadData()
                            
                            self.hideHUD()
                        }
                        catch {
                            print("Error 2")
                        }
                    }
                }
                task.resume()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return responseArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "Cell"
        collectionDemoView.register(UINib(nibName: "CollectionDemoCell", bundle:nil), forCellWithReuseIdentifier:cellIdentifier)
        
        let cell = collectionDemoView.dequeueReusableCell(withReuseIdentifier:cellIdentifier, for: indexPath) as! CollectionDemoCell
        
        var nameArray = NSArray()
        var capitalArray = NSArray()
        var regionArry = NSArray()
        nameArray = responseArray.value(forKey: "name") as! NSArray
        var sortedNameArray = nameArray.sorted { ($0 as AnyObject).localizedCaseInsensitiveCompare(($1 as AnyObject) as! String) == ComparisonResult.orderedDescending }
        
        capitalArray = responseArray.value(forKey: "capital") as! NSArray
        let sortedCapitalArray = capitalArray.sorted {($0 as AnyObject).localizedCaseInsensitiveCompare(($1 as AnyObject)as! String) == ComparisonResult.orderedAscending}
        regionArry = responseArray.value(forKey: "region") as! NSArray
        
        cell.countryNameLbl.text = (sortedNameArray[indexPath.row] as! NSString) as String
        cell.capitalNameLbl.text = (sortedCapitalArray[indexPath.row] as! NSString) as String
        cell.regionNameLbl.text = (regionArry[indexPath.row]as! NSString) as String
        return cell
    }
    
    
    
    
}
