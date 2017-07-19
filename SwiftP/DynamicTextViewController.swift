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
    
    var mutableDataArray:NSMutableArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mutableDataArray = ["Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.","ion ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.","Test", "12345679647968764345879645484764879646847896"]
        self.dynamicTblView.dataSource = self
        self.dynamicTblView.delegate = self
        let nib = UINib(nibName: "DynamicCell", bundle: nil)
        self.dynamicTblView.register(nib, forCellReuseIdentifier: "Cell")
    }
    override func viewWillAppear(_ animated: Bool) {
        self.dynamicTblView.estimatedRowHeight = 83
        self.dynamicTblView.rowHeight = UITableViewAutomaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mutableDataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dynamicTblView .dequeueReusableCell(withIdentifier: "Cell")as! DynamicCell
        cell.dataTxtView.text = mutableDataArray .object(at: indexPath.row) as! String
        return cell
    }
   

}
