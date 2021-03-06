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
    weak var loginControllerDelegate: LoginControllerDelegate?
    var menuController: UIViewController!
    var centerController: UIViewController!
    private var topConstraint: NSLayoutConstraint!
    private var leadingConstraint: NSLayoutConstraint!
    private var trailingConstraint: NSLayoutConstraint!
    private var bottomConstraint: NSLayoutConstraint!
    var isExpanded = false
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureHomeController()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private
    func configureHomeController() {
        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        let navigationBarAppearace = UINavigationBar.appearance()
        let attrs = [NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .regular)]
        
        navigationBarAppearace.titleTextAttributes = attrs
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.isTranslucent = false
        navigationBarAppearace.barTintColor = UIColor.getRGB(red: 128, green: 29, blue: 30)
        centerController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerController.view)
        topConstraint = centerController.view.topAnchor.constraint(equalTo: self.view.topAnchor)
        bottomConstraint = centerController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        leadingConstraint = centerController.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        trailingConstraint = centerController.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, bottomConstraint, trailingConstraint])
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        let menuVC = SlideOutMenuController()
        menuVC.delegate = loginControllerDelegate
        if menuController == nil {
            menuController = menuVC
            view.insertSubview(menuController.view, at: 0)
            menuController.view.translatesAutoresizingMaskIntoConstraints = false
            menuController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            menuController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            menuController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            menuController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("did add menuController")
        }
    }
    
    // MARK: - Actions

    func showMenuController(shouldExpand: Bool) {
        if shouldExpand {
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.centerController.view.setCornerRadius(cornerR: 12)
                self.topConstraint.constant = 50
                self.bottomConstraint.constant = -50
                self.leadingConstraint.constant = self.centerController.view.frame.width * 0.6
                self.trailingConstraint.constant = self.centerController.view.frame.width * 0.6
            }, completion: nil)
//            homeController.mainCollectionView.isUserInteractionEnabled = false
//            homeController.menuBar.isUserInteractionEnabled = false
        } else {
            // hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.setCornerRadius(cornerR: 0)
                self.topConstraint.constant = 0
                self.bottomConstraint.constant = 0
                self.leadingConstraint.constant = 0
                self.trailingConstraint.constant = 0
            }, completion: nil)
//            homeController.mainCollectionView.isUserInteractionEnabled = true
//             homeController.menuBar.isUserInteractionEnabled = true
        }
    }
}

// MARK: - Protocols

extension ContainerController: HomeControllerDelegate {
    func slideOutMenuToggled() {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded)
    }
}
