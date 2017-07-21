
//
//  CustomHeaderViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 19/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

struct headerStruct {
    var image: UIImage!
    var name: String!
}
var heightForHeader:CGFloat = 44
class CustomHeaderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var headerTblView: UITableView!
    var arrayOfData = [headerStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerTblView.dataSource = self
        self.headerTblView.delegate = self
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        self.headerTblView.register(nib, forCellReuseIdentifier: "Cell")
        
        arrayOfData = [headerStruct.init(image: #imageLiteral(resourceName: "heart"), name: "Header"),headerStruct.init(image: #imageLiteral(resourceName: "heart"), name: "Header"),headerStruct.init(image: #imageLiteral(resourceName: "heart"), name: "Header"),headerStruct.init(image: #imageLiteral(resourceName: "heart"), name: "Header"),headerStruct.init(image: #imageLiteral(resourceName: "heart"), name: "Header"),headerStruct.init(image: #imageLiteral(resourceName: "heart"), name: "Header"),headerStruct.init(image: #imageLiteral(resourceName: "heart"), name: "Header")]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.headerTblView.dequeueReusableCell(withIdentifier: "Cell")as! CustomCell
        cell.nameLabel.text = "CustomCell"
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeader
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        headerView.headerImageView.image = arrayOfData[section].image
        headerView.headerNameLabel.text = arrayOfData[section].name
        return headerView
    }
}
