//
//  DataReceiveViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 15/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit

class DataReceiveViewController: UIViewController {
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var fullNameLbl: UILabel!
    
    
    var firstNameStr:NSString!
    var lastNameStr :NSString!
    var fullNameStr :NSString!
    var recevingDataArray :NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*Data receiving as String
        firstNameLbl.text = firstNameStr as String?
        lastNameLbl.text = lastNameStr as String
        fullNameLbl.text = fullNameStr as String*/
        /*Data receiving as UserDefaults*/
        
        /* Data Receiving in UserDefaults
        let userDeafults = UserDefaults.standard
        firstNameLbl.text = userDeafults.string(forKey: "FirstName")
        lastNameLbl.text = userDeafults.string(forKey: "LastName")
        fullNameLbl.text = userDeafults.string(forKey: "FullName")*/
 
        
    }

    @IBAction func backBtnAction(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let dataPass = storyBoard.instantiateViewController(withIdentifier: "DataPassingViewController")
        self.navigationController?.pushViewController(dataPass, animated: true)
    }

}
