//
//  JsonParsingViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 08/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class JsonParsingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var fetchedCountryCapital = [CountryClass]()
    
    @IBOutlet weak var countryTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTblView.dataSource = self
        countryTblView.delegate = self
        parseData()
        SearchBar()
    }
    func SearchBar () {
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50))
        searchBar.delegate = self
        searchBar.showsScopeBar = true
        searchBar.tintColor = UIColor.lightGray
        searchBar.scopeButtonTitles = ["Country", "Capital"]
        self.countryTblView.tableHeaderView = searchBar
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            parseData()
        }
        else {
            if searchBar.selectedScopeButtonIndex == 0 {
                fetchedCountryCapital = fetchedCountryCapital.filter({ (country) -> Bool in
                    return country.countryStr.lowercased().contains(searchText.lowercased())
                })
            }
            else {
                fetchedCountryCapital  = fetchedCountryCapital.filter({ (country) -> Bool in
                    return country.capitalStr.lowercased().contains(searchText.lowercased())
                })
            }
        }
        self.countryTblView .reloadData()
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        self.countryTblView .reloadData()
        return true
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedCountryCapital.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = countryTblView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = fetchedCountryCapital[indexPath.row].countryStr
        cell?.detailTextLabel?.text = fetchedCountryCapital[indexPath.row].capitalStr
        
        return cell!
    }
    func parseData() {
        fetchedCountryCapital = []
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
                    let fetchedDataArray = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    print(fetchedDataArray)
                    for eachFetchedCountry in fetchedDataArray {
                        let eachCountry = eachFetchedCountry as! [String: Any]
                        let countryNameStr = eachCountry["name"] as! String
                        let capitalNameStr = eachCountry["capital"] as! String
                        self.fetchedCountryCapital.append(CountryClass(country: countryNameStr, capital:capitalNameStr))
                    }
                    print(self.fetchedCountryCapital)
                    self.countryTblView.reloadData()
                }
                catch {
                    print("Error 2")
                }
            }
        }
        task.resume()
    }

}

class CountryClass {
    var countryStr : String
    var capitalStr : String
    init(country :String , capital : String) {
        self.countryStr = country
        self.capitalStr = capital
    }
}






