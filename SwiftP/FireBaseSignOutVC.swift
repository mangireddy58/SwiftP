//
//  FireBaseSignOutVC.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 10/08/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Firebase

class FireBaseSignOutVC: RootViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.userNameLabel.text = FIRAuth.auth()?.currentUser?.displayName
    }

    
    @IBAction func signOutAction(_ sender: Any) {
        do {
            try FIRAuth.auth()?.signOut()
            self.fnForFireBaseLoginVC()
        } catch {
            
        }
    }

}
