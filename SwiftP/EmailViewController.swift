//
//  EmailViewController.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 29/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import MessageUI

class EmailViewController: RootViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    // MARK:- Email
    @IBAction func emailBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            let mailComposer = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposer, animated: true)
            }
            else {
                self.showSendEmailErrorAlert()
            }
        case 2:
            let messageComposer = configuredMessageComposeViewController()
            if MFMessageComposeViewController.canSendText() {
                self.present(messageComposer, animated: true)
            }
            else {
                self.messageErrorAlert()
            }
        case 3:
            let date = Date()
            let msg = "Hi my dear friends\(date)"
            let urlWhats = "whatsapp://send?text=\(msg)"
            if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
                if let whatsappURL = NSURL(string: urlString) {
                    if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                        UIApplication.shared.openURL(whatsappURL as URL)
                    } else {
                        print("please install whatsup")
                        self.whatsupErrorAlert()
                    }
                }
            }
        case 4:
            let textToShare = "Swift Testing"
            let activityController = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
            activityController.popoverPresentationController?.sourceView = self.view
            activityController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook]
            self.present(activityController, animated: true, completion: nil)
            /*
             { image to share
             let image = UIImage(named: "1.png")
             
             // set up activity view controller
             let imageToShare = [ image! ]
             let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
             activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
             
             // exclude some activity types from the list (optional)
             activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
             
             // present the view controller
             self.present(activityViewController, animated: true, completion: nil)
             }*/
        default:
            print("failed")
        }
    }
    // MARK: MFMailComposeViewControllerDelegate
    func configuredMailComposeViewController()-> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["mangireddy.y@gmail.com"])
        mailComposerVC.setSubject("Swift email testing")
        mailComposerVC.setMessageBody("From swift developer", isHTML: false)
        
        return mailComposerVC
    }
    func showSendEmailErrorAlert() {
        let mailErrorAlert = UIAlertController(title: "Could Not Send Email", message: "Your device could not send e-mail.  Please check e-mail configuration and try again.", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (alert) in
            
        }
        mailErrorAlert.addAction(okAction)
        self.present(mailErrorAlert, animated: true, completion: nil)
    }
    
    @objc(mailComposeController:didFinishWithResult:error:)
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult,error: Error?) {
        controller.dismiss(animated: true)
    }
    // MARK: MFMessageComposeViewControllerDelegate
    func configuredMessageComposeViewController()-> MFMessageComposeViewController {
        let messageComposerVC = MFMessageComposeViewController()
        messageComposerVC.body = "Swift message to phone number"
        messageComposerVC.recipients = ["9963037558"]
        messageComposerVC.messageComposeDelegate = self
        return messageComposerVC
    }
    func messageErrorAlert () {
        let messageErrorAlert = UIAlertController(title: "Could Not Send Message", message: "Please check your balance", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (alert) in
        }
        messageErrorAlert.addAction(okAction)
        self.present(messageErrorAlert, animated: true, completion: nil)
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        //... handle sms screen actions
        self.dismiss(animated: true, completion: nil)
    }
    
    func whatsupErrorAlert () {
        let messageErrorAlert = UIAlertController(title: "Please install whatsup on your phone", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (alert) in
    }
    messageErrorAlert.addAction(okAction)
    self.present(messageErrorAlert, animated: true, completion: nil)
    }
    
    
    
    
}
