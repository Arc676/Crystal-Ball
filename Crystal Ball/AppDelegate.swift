//
//  AppDelegate.swift
//  Crystal Ball
//
//  Created by Alessandro Vinciguerra on 2015-12-31.
//      <alesvinciguerra@gmail.com>
//Copyright (C) 2015-2019 Arc676/Alessandro Vinciguerra

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
//See README and LICENSE for more details

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userIsEnteringSettings = false


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let preferredLanguages = Locale.preferredLanguages
        var lang = "en"
        for i in 0 ... preferredLanguages.count {
            if (["en","it","zh-Hans","fr","de"].contains(preferredLanguages[i])){
                lang = preferredLanguages[i]
                break
            }
        }
        let appDefaults : [String : [AnyObject]] = [
            "AppleLanguages" : [lang as AnyObject],
            "LanguageConfirmed" : [false as AnyObject]
        ]
        UserDefaults.standard.register(defaults: appDefaults)
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "userDidEnterSettings"), object: nil, queue: nil, using: { _ in 
            self.userIsEnteringSettings = true
        })
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        if userIsEnteringSettings {
            exit(0)
        }
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        userIsEnteringSettings = false
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}
