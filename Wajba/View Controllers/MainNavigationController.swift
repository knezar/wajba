//
//  MainNavigationController.swift
//  Wajba
//
//  Created by C4Q on 1/23/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.

        if isLoggedIn() {
            let mainViewController = MainMenuViewController(nibName: "MainMenuViewController", bundle: nil)
            setNavigationBarHidden(false, animated: true)
            let navigationBarAppearace = UINavigationBar.appearance()
            let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
            
            navigationBarAppearace.titleTextAttributes = attrs
            navigationBarAppearace.tintColor = UIColor.white
            navigationBarAppearace.isTranslucent = false
            navigationBarAppearace.barTintColor = UIColor.getRGB(red: 128, green: 29, blue: 30)

            viewControllers = [mainViewController]
        } else {
            perform(#selector(showLogInController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool{
        return true
    }
    
    @objc func showLogInController() {
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        loginController.modalPresentationStyle = .fullScreen
        present(loginController,animated: true, completion: {
            
        })
    }
}
