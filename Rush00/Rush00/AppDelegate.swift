//
//  AppDelegate.swift
//  Rush00
//
//  Created by Дмитрий on 28.11.2020.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let ud = UserDefaults.standard
        ud.set("https://api.intra.42.fr/oauth/authorize?", forKey: "baseURL")
        ud.set("https://api.intra.42.fr/oauth/token", forKey: "continueAuthentificationBaseURL")
        ud.set("c00661489a435e9fe5ed073ff3879bc644e1854624280b3cac0d0ccb91b3b2af", forKey: "uid")
        ud.set("com.qclubfoo.swifty://oauth2callback", forKey: "redirectURI")
        ud.set("com.qclubfoo.swifty%3A%2F%2Foauth2callback", forKey: "uri")
        ud.set("66fbb1a65c13d75a970b30d5d23bc7c1fa7684c21e8be5b5e8fa5736f7005316", forKey: "secrete")
        
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

