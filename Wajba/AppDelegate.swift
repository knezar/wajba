//
//  AppDelegate.swift
//  Wajba
//
//  Created by C4Q on 1/19/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13.0, *) {
        return true
        } else {
            let navigationBarAppearace = UINavigationBar.appearance()
            let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                             NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
                
            navigationBarAppearace.titleTextAttributes = attrs
            navigationBarAppearace.tintColor = UIColor.white
            navigationBarAppearace.isTranslucent = false
            navigationBarAppearace.barTintColor = UIColor.getRGB(red: 128, green: 29, blue: 30)

            self.window = UIWindow(frame: UIScreen.main.bounds)
            if let window = window {
            let rootViewController = UINavigationController(rootViewController: LoginViewController(nibName: "LoginViewController", bundle: nil))
                rootViewController.setNavigationBarHidden(true, animated: true)
                window.rootViewController = rootViewController
                window.makeKeyAndVisible()
            }
        return true
        }
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

