//
//  MainNavigationController.swift
//  Wajba
//
//  Created by C4Q on 1/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

protocol LoginControllerDelegate: class {
    func finishLoggingIn()
    func finishLoggingOut()
}

class MainNavigationController: UINavigationController, LoginControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        // Do any additional setup after loading the view.

        if isLoggedIn() {
            finishLoggingIn()
        } else {
            finishLoggingOut()
        }
    }
    
    func finishLoggingIn() {
        let mainViewController = MainMenuViewController(nibName: "MainMenuViewController", bundle: nil)
        mainViewController.delegate = self
        let navigationBarAppearace = UINavigationBar.appearance()
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        
        navigationBarAppearace.titleTextAttributes = attrs
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barTintColor = UIColor.getRGB(red: 128, green: 29, blue: 30)
        setNavigationBarHidden(false, animated: true)
        setViewControllers([mainViewController], animated: true)
    }
    
    func finishLoggingOut() {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginController.delegate = self
        setNavigationBarHidden(true, animated: true)
        setViewControllers([loginController], animated: true)
    }
        
    fileprivate func isLoggedIn() -> Bool{
        return UserDefaultsHelper.manager.isLoggedIn()
    }
}
