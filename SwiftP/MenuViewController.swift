//
//  MenuViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 27/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class MenuViewController: RootViewController {

    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    
}
