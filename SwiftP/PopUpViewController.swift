//
//  PopUpViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 21/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit


class PopUpViewController: RootViewController {

    @IBOutlet weak var popUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func popUpBtnAction(_ sender: Any) {
        self.showGeneralAlert(message: "Done")
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let asPopUp = storyBoard.instantiateViewController(withIdentifier: "ViewControllerAsPopUp")
//        asPopUp.view.backgroundColor = UIColor(red: 121.0/255.0, green: 135.0/255.0, blue: 160.0/255.0, alpha: 1.0)
//        asPopUp.modalPresentationStyle = UIModalPresentationStyle.custom
////        asPopUp.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
//        self.navigationController?.present(asPopUp, animated: true, completion: nil)
    }
   
    
}
