//
//  ContainerController.swift
//  Wajba
//
//  Created by C4Q on 1/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    // MARK: - Properties
    let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private
    func configureHomeController() {
        let navController = UINavigationController(rootViewController: homeController)
        let navigationBarAppearace = UINavigationBar.appearance()
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        
        navigationBarAppearace.titleTextAttributes = attrs
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barTintColor = UIColor.getRGB(red: 128, green: 29, blue: 30)
            view.addSubview(navController.view)
            addChild(navController)
            navController.didMove(toParent: self)
    }
    
    func configureMenuController() {
    
    }
    // MARK: - Handlers
    
    // MARK: - Private
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
