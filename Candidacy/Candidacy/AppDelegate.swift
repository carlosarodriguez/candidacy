//
//  AppDelegate.swift
//  Candidacy
//
//  Created by Kevin Avila on 10/11/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit
import REFrostedViewController
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var delegate:CandidateParseProtocol? = nil


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //customize navbar appearance
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = UIColor(red: 247/255, green: 80/255, blue: 67/255, alpha: 1.0)
        appearance.titleTextAttributes = [NSFontAttributeName: UIFont(name: "avenir-medium", size: 20)!,  NSForegroundColorAttributeName: UIColor.whiteColor()]
        appearance.translucent = false
        appearance.barStyle = UIBarStyle.Black
        
        //Remove hairline pixel seperating navbar and background
        appearance.setBackgroundImage(
            UIImage(),
            forBarPosition: .Any,
            barMetrics: .Default)
        
        // Parse application ID and client ID
        Parse.setApplicationId("nDqHc4Iv70AgWRP0cyatqlVKN1PNjkYNIUKPvm99", clientKey:"oPda5aM2kPZXWbppTE3NpydOxbIdaPCPV1X8nBdL")
        appearance.shadowImage = UIImage()
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        dispatch_async(backgroundQueue, {
            //self.loadCandidatesFromParse()
            self.delegate = CandidatesViewController()
            self.delegate?.callParse()
        })
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
            
        return true
    }
    

}

