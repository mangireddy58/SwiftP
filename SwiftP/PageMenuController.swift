//
//  PageMenuController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 22/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import PageMenu

class PageMenuController: RootViewController {

    
    var pageMenu : CAPSPageMenu?
    var parameters: [CAPSPageMenuOption] = []
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var controllerArray : [UIViewController] = []
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC : MainViewController = storyBoard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        mainVC.title = "MainVC"
        mainVC.parentNavigationController = self.navigationController
        controllerArray.append(mainVC)
        
        let loginVC: LoginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.title = "LoginVC"
        loginVC.parentNavigationController = self.navigationController
        controllerArray.append(loginVC)
        let regiVC: RegisterViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        regiVC.title = "RegistrationVC"
        regiVC.parentNavigationController = self.navigationController
        controllerArray.append(regiVC)
        
        let collectionVC: CollectionDemoController = storyBoard.instantiateViewController(withIdentifier: "CollectionDemoController") as! CollectionDemoController
        collectionVC.title = "Collection"
        collectionVC.parentNavigationController = self.navigationController
        controllerArray.append(collectionVC)
        
        switch Height {
        case 568.0:
            parameters = [
                .scrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
                .viewBackgroundColor(UIColor.clear),//(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
                .selectionIndicatorColor(UIColor.orange),
                .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
                .menuItemSeparatorColor(UIColor.black),
                .useMenuLikeSegmentedControl(true),
                .menuItemFont(UIFont(name: "HelveticaNeue", size: 13.0)!),
                .menuHeight(40.0),
                .titleTextSizeBasedOnMenuItemWidth(true),
                .centerMenuItems(true)
            ]
        case 667.0:
            parameters = [
                .scrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
                .viewBackgroundColor(UIColor.clear),//(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
                .selectionIndicatorColor(UIColor.orange),
                .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
                .menuItemSeparatorColor(UIColor.black),
                .useMenuLikeSegmentedControl(true),
                .menuItemFont(UIFont(name: "HelveticaNeue", size: 15.0)!),
                .menuHeight(50.0),
                .titleTextSizeBasedOnMenuItemWidth(true),
                .centerMenuItems(true)
            ]
        case 736.0:
            parameters = [
                .scrollMenuBackgroundColor(UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)),
                .viewBackgroundColor(UIColor.clear),//(red: 20.0/255.0, green: 20.0/255.0, blue: 20.0/255.0, alpha: 1.0)),
                .selectionIndicatorColor(UIColor.orange),
                .bottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
                .menuItemSeparatorColor(UIColor.black),
                .useMenuLikeSegmentedControl(true),
                .menuItemFont(UIFont(name: "HelveticaNeue", size: 17.0)!),
                .menuHeight(50.0),
                .titleTextSizeBasedOnMenuItemWidth(true),
                .centerMenuItems(true)
            ]
        default:
            print("not an iPhone")
            
        }
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.contentView.frame.width, height: self.contentView.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.contentView.addSubview(pageMenu!.view)
        
        pageMenu!.didMove(toParentViewController: self)
        
    }

}
