//
//  AppDelegate.swift
//  Crystal Ball
//
//  Created by Alessandro Vinciguerra on 12/31/15.
//  Copyright © 2015 Arc676. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userIsEnteringSettings = false


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let preferredLanguages = NSLocale.preferredLanguages()
        var lang = "en"
        for i in 0 ... preferredLanguages.count {
            if (["en","it","zh-Hans","fr","de"].contains(preferredLanguages[i])){
                lang = preferredLanguages[i]
                break
            }
        }
        let appDefaults : [String : AnyObject] = [
            "AppleLanguages" : [lang],
            "LanguageConfirmed" : false
        ]
        NSUserDefaults.standardUserDefaults().registerDefaults(appDefaults)
        NSNotificationCenter.defaultCenter().addObserverForName("userDidEnterSettings", object: nil, queue: nil, usingBlock: { _ in 
            self.userIsEnteringSettings = true
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
        if userIsEnteringSettings {
            exit(0)
        }
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        userIsEnteringSettings = false
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}