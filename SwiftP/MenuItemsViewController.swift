//
//  MenuItemsViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 27/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit


class MenuItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menuItemsArray = NSMutableArray()
    @IBOutlet weak var menuItemsTbleView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItemsArray = ["Home", "FirstViewController", "SecondViewController", "ThirdViewController", "FourthViewController", "FifthViewController", "Logout"]
        menuItemsTbleView.dataSource = self
        menuItemsTbleView.delegate = self
//        menuItemsTbleView.rowHeight = UITableViewAutomaticDimension
//        menuItemsTbleView.estimatedRowHeight = 300
        menuItemsTbleView.estimatedSectionHeaderHeight = 160
    }
    //FIXME: - TableviewController Datasource & Delegate
    // TODO: -
    // MARK:-
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        }
//        else {
            return menuItemsArray.count
//        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = menuItemsTbleView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeaderCell")
        menuItemsTbleView.register(UINib(nibName: "MenuHeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "MenuHeaderCell")
        menuItemsTbleView.tableHeaderView = cell
        return cell?.contentView
    }
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let cell = self.menuItemsTbleView.dequeueReusableCell(withIdentifier: "MenuHeaderCell") as! MenuHeaderCell
//        return cell
//    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier = "Cell"
            menuItemsTbleView.register(UINib(nibName: "MenuItemCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
            let cell = menuItemsTbleView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MenuItemCell
            cell.menuNameLbl.text = (menuItemsArray[indexPath.row] as! String)
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Home")
        }
        else if indexPath.row == 1 {
            print("First")
        }
        else if indexPath.row == 2 {
            print("Second")
        }
        else if indexPath.row == 3 {
            print("Third")
        }
        else if indexPath.row == 4 {
            print("Fourth")
        }
        else if indexPath.row == 5 {
            print("Fifth")
        }
        else if indexPath.row == 6 {
            print("Logout")
        }
    }
    
    
    
}
