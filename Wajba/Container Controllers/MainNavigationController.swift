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
            finishLoggingOut()
        }
    }
    
    func finishLoggingIn() {
        let containerController = ContainerController()
        containerController.loginControllerDelegate = self
        setViewControllers([containerController], animated: true)
    }
    
    func finishLoggingOut() {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginController.delegate = self
        setViewControllers([loginController], animated: true)
    }
        
    fileprivate func isLoggedIn() -> Bool{
        return UserDefaultsHelper.manager.isLoggedIn()
    }
}
