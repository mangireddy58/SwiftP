//
//  MultipleCustomCellViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 19/07/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class MultipleCustomCellViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var demoTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.demoTblView.dataSource = self;
        self.demoTblView.delegate = self;
        
        let rightNib = UINib(nibName: "RightCustomCell", bundle: nil)
        self.demoTblView.register(rightNib, forCellReuseIdentifier: "RightCell")
        let leftNib = UINib(nibName: "LeftCustomCell", bundle: nil)
        self.demoTblView.register(leftNib, forCellReuseIdentifier: "LeftCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item % 2 == 0 {
            let rightCell = tableView.dequeueReusableCell(withIdentifier: "RightCell")as! RightCustomCell
            rightCell.rightLabel.text = "Right"
            return rightCell
            
        }
        else {
            let leftCell = tableView.dequeueReusableCell(withIdentifier: "LeftCell") as! LeftCustomCell
            leftCell.leftLabel.text = "Left"
            return leftCell
        }
    }
    
    
}
