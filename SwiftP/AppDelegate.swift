//
//  AppDelegate.swift
//  SwiftP
//
//  Created by Rushikesh Kulkarni on 07/06/17.
//  Copyright © 2017 simplicity. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleSignIn
import FacebookCore
import FacebookLogin
import FBSDKLoginKit
import UserNotifications
import UserNotificationsUI
import AudioToolbox
import Firebase

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate{
    var token: String = ""
    var window: UIWindow?
    var storyBoard :UIStoryboard?
    var navigationController : UINavigationController?
   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //Push notifications
        self.fnForRegisterRemoteNotification()
        
        //For IQKeyboardManager
        IQKeyboardManager.sharedManager().enable = true
        
        //Firebase configuration
        DispatchQueue.main.async {
            FIRApp.configure()
        }
        // Facebook 
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        self.setBadgeCounter(count: 0)
        
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        if navigationController == nil {
            navigationController = UINavigationController()
        }
        if storyBoard == nil {
            storyBoard = UIStoryboard(name: "Main", bundle:nil)
        }
        navigationController?.setNavigationBarHidden(true, animated: true)
        // storyboard with identifer
        let maincontroller = storyBoard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        navigationController?.pushViewController(maincontroller , animated: true)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        self.setBadgeCounter(count: 0)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.setBadgeCounter(count: 0)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        self.setBadgeCounter(count: 0)
    }
    //MARK:- CallBAck Methods
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        /*if [url.absoluteString].contains("google") {
            if #available(iOS 9.0, *) {
                let options: [String: AnyObject] = [UIApplicationOpenURLOptionsKey.sourceApplication.rawValue: sourceApplication as AnyObject, UIApplicationOpenURLOptionsKey.annotation.rawValue: annotation as AnyObject]
                print(options)
            } else {
                // Callback on earlier versions
            }
            return GIDSignIn.sharedInstance().handle(url as URL!,sourceApplication: sourceApplication,annotation: annotation)
        }
        else {
            return FBSDKApplicationDelegate.sharedInstance().application(application, open: url as URL!, sourceApplication: sourceApplication, annotation: annotation)
        }*/
    let checkFB = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    let checkGoogle = GIDSignIn.sharedInstance().handle(url as URL!,sourceApplication: sourceApplication,annotation: annotation)
    //let checkLinkedIn = LISDKCallbackHandler.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        
        return checkGoogle || checkFB //|| checkLinkedIn
    }
    //MARK:- AppDelgate Method
    func mAppDelegate() -> AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    //MARK:- Notifications
    func fnForRegisterRemoteNotification()  {
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            DispatchQueue.main.async(execute: {
                UIApplication.shared.registerForRemoteNotifications()
            })
        }
        else {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
            DispatchQueue.main.async(execute: {
                UIApplication.shared.registerForRemoteNotifications()
            })
        }
    }
    //MARK:-Remote Notification Delegate // <= iOS 9.x
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        DispatchQueue.main.async(execute: {
            UIApplication.shared.registerForRemoteNotifications()
        })
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Got token data! \(deviceToken)")
        for i in 0..<deviceToken.count {
            token += String(format: "%02.2hhx", deviceToken[i] as CVarArg)
        }
        print("Device Token Id \(token)")
        
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print(userInfo)
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error)
    }
    //MARK:- UNUserNotificationCenter Delegate // >= iOS 10
    @available(iOS 10.0, *)
    func userNotificationCenter(center: UNUserNotificationCenter, willPresentNotification notification: UNNotification, withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void) {
        print("User Info = %@",notification.request.content.userInfo)
        completionHandler([.badge, .alert, .sound])
        
    }
    @available(iOS 10.0, *)
    func userNotificationCenter(center: UNUserNotificationCenter, didReceiveNotificationResponse response: UNNotificationResponse, withCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        print("User Info = %@",response.notification.request.content.userInfo);
        let application:UIApplication = UIApplication.shared
        if application.applicationState == UIApplicationState.active {
            print("Active")
            AudioServicesPlaySystemSound(1002)
        }
        else if application.applicationState == UIApplicationState.background {
            print("Background")
            self .callApplicationInactiveForPush(payload: response.notification.request.content.userInfo as NSDictionary)
        }
        else if application.applicationState == UIApplicationState.inactive {
            print("InActive")
            self .callApplicationInactiveForPush(payload: response.notification.request.content.userInfo as NSDictionary)
        }
        completionHandler(.newData)
    }
    func callApplicationInactiveForPush(payload:NSDictionary){
        print(payload)
        self.setBadgeCounter(count: 0)
    }
    
    
    //MARK:- Custom Methods
    func setBadgeCounter(count:NSInteger) {
        if count == 0 {
            UIApplication.shared.applicationIconBadgeNumber = count
        }
        else {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
    }
    
    
}

