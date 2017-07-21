//
//  RootViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 07/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import Foundation
import RMUniversalAlert
import JSSAlertView
import Alamofire
import SwiftyJSON

let BASE_URL =  "http://bunker360v3.cloudapp.net/JsonService.svc/GetListaNotifications"
let LOGIN_SERVICE_NAME = "login"
let LOGIN_PARAMETERS = "{\"user\": {\"email\": \"%@\",\"password\": \"%@\"},\"userPersonalDetails\": {\"iosId\":\"%@\"}}"

var Bounds = UIScreen.main.bounds
var Height = Bounds.size.height
var Width = Bounds.size.height

var systemVersion = UIDevice.current.systemVersion

var kPasswordCharacterMaxLimit = 16
var kPasswordCharacterMinLimit = 6
var kMobileNumberLimit = 10

var FONTNAME_LIGHT = "AppleSDGothicNeo-Regular"
var FONTNAME_BOLD  = "AppleSDGothicNeo-Bold"

// For loader width
var LOADER_WIDTH_5:UInt?   = 180
var LOADER_HEIGHT_5:UInt?  = 54
var LOADER_WIDTH_6:UInt?   = 200
var LOADER_HEIGHT_6:UInt?  = 70
var LOADER_WIDTH_6P:UInt?  = 320
var LOADER_HEIGHT_6P:UInt? = 92

var LFONT15 = UIFont(name: FONTNAME_BOLD, size: 15)
var LFONT16 = UIFont(name: FONTNAME_BOLD, size: 16)
var LFONT18 = UIFont(name: FONTNAME_BOLD, size: 18)

class RootViewController: UIViewController {
var storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    //For Menu Btn
    @IBOutlet weak var menuBtnAction: UIButton!
    
    var mViewLoading:UIView!
    var mImageViewLoading:UIImageView?
    var mLabelLoading:UILabel?
    var loadingLabelFont:UIFont?
    var loaderWidth:UInt? = 180
    var loaderHeight:UInt? = 54
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    // Login ViewController
    func fnForLoginViewController() {
        let secondViewController = storyBoard.instantiateViewController(withIdentifier: "DownloadJsonViewController") as! DownloadJsonViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    //MARK:- Valid EmailId
    func validEmailId(inputText: String)-> Bool {
        print("validate emilId: \(inputText)")
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: inputText)
        return result
    }
    //MARK:- Show General Alert
    func showGeneralAlert(message: String) -> Void {
       let alertview = JSSAlertView().show(self,title: "",
            text: message)
        alertview.addAction {
            
        }
        alertview.setTitleFont("ClearSans-Bold") // Title font
//        alertview.setTextFont("ClearSans") // Alert body text font
        alertview.setButtonFont("ClearSans-Light") // Button text font
        alertview.setTextTheme(.dark)
    }
    //MARK:- Date format with string
    func changeDateFormatWithString(dateString:NSString) -> NSString {
        var dateStr = dateString
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        dateStr = formatter.string(from: Date()) as NSString
        let yourDate = formatter.date(from: dateStr as String)
        formatter.dateFormat = "d-MMMM-yyyy"
        let finalStr = formatter.string(from: yourDate!)
        return finalStr as NSString
    }
    
    //MARK:- MENU BUTTTON ACTION
    @IBAction func menuBtnAction(_ sender: UIButton) {
        menuBtnAction.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    //MARK:- AddProgressBar
    func addProgressIndicator() {
        mViewLoading = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        switch Height {
        case 568.0:
            loaderWidth = LOADER_WIDTH_5
            loaderHeight = LOADER_HEIGHT_5
            loadingLabelFont = LFONT15
        case 667.0:
            loaderWidth = LOADER_WIDTH_6
            loaderHeight = LOADER_HEIGHT_6
            loadingLabelFont = LFONT16
        case 736.0:
            loaderWidth = LOADER_WIDTH_6P
            loaderHeight = LOADER_HEIGHT_6P
            loadingLabelFont = LFONT18
        default:
            print("not an iPhone")
        }
        mImageViewLoading = UIImageView(frame: CGRect(x: (UIScreen.main.bounds.size.width/2)-CGFloat(loaderWidth!/2), y: (UIScreen.main.bounds.size.height/2)-CGFloat(loaderHeight!/2), width: CGFloat(loaderWidth!), height: CGFloat(loaderHeight!)))
        mImageViewLoading?.contentMode = .scaleAspectFit
        mViewLoading.alpha = 0.74
        mViewLoading.backgroundColor = UIColor.black
        self.view.addSubview(mViewLoading)
        self.view.addSubview(mImageViewLoading!)
        

        
        mImageViewLoading?.animationImages = [UIImage(named:"tmp-0.gif")!,
                                             UIImage(named:"tmp-1.gif")!,
                                             UIImage(named:"tmp-2.gif")!,
                                             UIImage(named:"tmp-3.gif")!,
                                             UIImage(named:"tmp-4.gif")!,
                                             UIImage(named:"tmp-5.gif")!,
                                             UIImage(named:"tmp-6.gif")!,
                                             UIImage(named:"tmp-7.gif")!,
                                             UIImage(named:"tmp-8.gif")!,
                                             UIImage(named:"tmp-9.gif")!,
                                             UIImage(named:"tmp-10.gif")!,
                                             UIImage(named:"tmp-11.gif")!,
                                             UIImage(named:"tmp-12.gif")!,
                                             UIImage(named:"tmp-13.gif")!,
                                             UIImage(named:"tmp-14.gif")!,
                                             UIImage(named:"tmp-15.gif")!,
                                             UIImage(named:"tmp-16.gif")!,
                                             UIImage(named:"tmp-17.gif")!,
                                             UIImage(named:"tmp-18.gif")!,
                                             UIImage(named:"tmp-19.gif")!,
                                             UIImage(named:"tmp-20.gif")!,
                                             UIImage(named:"tmp-21.gif")!,
                                             UIImage(named:"tmp-22.gif")!,
                                             UIImage(named:"tmp-23.gif")!,
                                             UIImage(named:"tmp-24.gif")!,
                                             UIImage(named:"tmp-25.gif")!,
                                             UIImage(named:"tmp-26.gif")!,
                                             UIImage(named:"tmp-27.gif")!,
                                             UIImage(named:"tmp-28.gif")!,
                                             UIImage(named:"tmp-29.gif")!]
        mImageViewLoading?.animationDuration = 0.9
        mImageViewLoading?.animationRepeatCount = 0
        
        mLabelLoading?.textAlignment = .center
        mLabelLoading?.backgroundColor = UIColor.clear
        mLabelLoading?.textColor = UIColor.white
        mLabelLoading?.font = loadingLabelFont
        mLabelLoading?.text = "Loading..."
        
        self.view.addSubview((mImageViewLoading)!)
    }
    //MARK:- ShowProgressBar
    func showProgressIndicator () {
        mViewLoading?.isHidden = false
        mImageViewLoading?.startAnimating()
        mImageViewLoading?.isHidden = false
        mLabelLoading?.isHidden = false
        self.view.isUserInteractionEnabled = false
    }
    //MARK:- HideProgressBar
    func hideProgressIndicator () {
        mImageViewLoading?.stopAnimating()
        mImageViewLoading?.isHidden = true
        mLabelLoading?.isHidden = true
        mViewLoading?.isHidden = true;
        self.view.isUserInteractionEnabled = true;
    }

    
    
    
    
    
    
    
    
}
