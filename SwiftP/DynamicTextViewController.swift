//
//  DynamicTextViewController.swift
//  PrototypeCells
//
//  Created by Rushikesh Kulkarni on 19/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class DynamicTextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dynamicTblView: UITableView!
    
    var refreshController:UIRefreshControl = UIRefreshControl()
    var mutableDataArray:[String] = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.","ion ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.","Test", "12345679647968764345879645484764879646847896"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dynamicTblView.dataSource = self
        self.dynamicTblView.delegate = self
        let nib = UINib(nibName: "DynamicCell", bundle: nil)
        self.dynamicTblView.register(nib, forCellReuseIdentifier: "Cell")
        let nib2 = UINib(nibName: "DynamicCell2", bundle: nil)
        self.dynamicTblView.register(nib2, forCellReuseIdentifier: "Cell2")
        
        refreshController.tintColor = UIColor.orange
        refreshController.backgroundColor = UIColor.lightGray
        refreshController.attributedTitle = NSAttributedString(string: "Loading...", attributes: [NSForegroundColorAttributeName:UIColor.orange])
        refreshController .addTarget(self, action: #selector(DynamicTextViewController.refreshData), for:UIControlEvents.valueChanged)
        if #available(iOS 10.0, *) {
            dynamicTblView.refreshControl = refreshController
        }
        else {
            dynamicTblView.addSubview(refreshController)
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.dynamicTblView.estimatedRowHeight = 80
        self.dynamicTblView.rowHeight = UITableViewAutomaticDimension
    }
    func refreshData() {
        mutableDataArray.append("One")
        mutableDataArray.append("Two")
        mutableDataArray.append("Three")
        dynamicTblView.reloadData()
        refreshController.endRefreshing()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset < -150 {
            refreshController.attributedTitle = NSAttributedString(string: "Loading Completed...", attributes: [NSForegroundColorAttributeName:UIColor.orange])
        }else {
            refreshController.attributedTitle = NSAttributedString(string: "Loading...", attributes: [NSForegroundColorAttributeName:UIColor.orange])
        }
        refreshController.backgroundColor = UIColor.lightGray
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mutableDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dynamicTblView .dequeueReusableCell(withIdentifier: "Cell2")as! DynamicCell2
        cell.dataLabel.text! = mutableDataArray[indexPath.row]// mutableDataArray .object(at: indexPath.row) as! String
        cell.dataLabel2.text! = mutableDataArray[indexPath.row]//mutableDataArray .object(at: indexPath.row) as! String
        
//        cell.dataLabel.text = mutableDataArray .object(at: indexPath.row) as? String
//        cell.dataLabel.numberOfLines = 0
        return cell
    }
   

}
