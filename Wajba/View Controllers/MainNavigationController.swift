//
//  MainNavigationController.swift
//  Wajba
//
//  Created by C4Q on 1/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController, LoginControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        // Do any additional setup after loading the view.

        if isLoggedIn() {
            finishLoggingIn()
        } else {
            let loginController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            loginController.delegate = self
            viewControllers = [loginController]
        }
    }
    
    func finishLoggingIn() {
        let mainViewController = MainMenuViewController(nibName: "MainMenuViewController", bundle: nil)
        let navigationBarAppearace = UINavigationBar.appearance()
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        
        navigationBarAppearace.titleTextAttributes = attrs
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barTintColor = UIColor.getRGB(red: 128, green: 29, blue: 30)
        setNavigationBarHidden(false, animated: true)
        viewControllers = [mainViewController]
    }
        
    fileprivate func isLoggedIn() -> Bool{
//        let newBool = !bool
        return false
    }
}
