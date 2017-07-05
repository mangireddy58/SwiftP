//
//  MainViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 07/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit



class MainViewController: RootViewController {
    
    var parentNavigationController : UINavigationController?
    @IBOutlet weak var testBtn: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var appDelegate : AppDelegate
        appDelegate = AppDelegate().mAppDelegate()
        print("Device Token ",appDelegate.token)
        
        dateLabel.text = self.changeDateFormatWithString(dateString: "10-02-2017") as String
    }
    
    
    @IBAction func nextBtnAction(_ sender: Any) {
        fnForLoginViewController()
    }
    
    

}
