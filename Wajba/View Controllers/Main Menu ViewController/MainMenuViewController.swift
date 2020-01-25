//
//  MainMenuViewController.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let menuBarItems = ["ALL", "TRENDING", "NEW", "FAVORITES"]
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    
    let graphicHelper = GraphicHelper()
    let menuBarCellID = "menuBarCell"
    let mainCollectionCellID = "mainCollectionCell"

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var menuBarCollectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurMenuBar()
        configureMainCollectionView()
        configureNavItems()
        backgroundImage.image = #imageLiteral(resourceName: "Background").blurred(radius: 14)
        navigationItem.title = "Wajba"
    }
    
    func configureNavItems() {
        navigationItem.leftBarButtonItem =  navButtonConfiguration(string: "Menu Icon", selector: #selector (handleMenuButtonPressed))
        navigationItem.rightBarButtonItem = navButtonConfiguration(string: "Search Icon", selector: #selector (handleSearchButtonPressed))
    }
    func navButtonConfiguration(string: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: string), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.addTarget(self, action: selector, for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: button)
        return barButton
    }
    
    func configurMenuBar() {
        self.menuBarCollectionView.register(UINib(nibName:"MenuBarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: menuBarCellID)
        self.menuBarCollectionView.delegate = self
        self.menuBarCollectionView.dataSource = self
        menuBarCollectionView.backgroundColor = UIColor.clear
        menuBarCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func configureMainCollectionView() {
        self.mainCollectionView.register(UINib(nibName:"MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: mainCollectionCellID)
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        mainCollectionView.backgroundColor = UIColor.clear
        mainCollectionView.showsVerticalScrollIndicator = false
    }
    
    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
        print("Menu button pressed")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == menuBarCollectionView {
            return menuBarItems.count

        } else {
            return imageItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == menuBarCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuBarCellID, for: indexPath) as! MenuBarCollectionViewCell
            cell.menuBarLabel.text = menuBarItems[indexPath.item]
             return cell
        } else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCollectionCellID, for: indexPath) as! MainCollectionViewCell
            cell.titleLabel.text = titleItems[indexPath.item]
            cell.backgroundImage.image = UIImage(named: imageItems[indexPath.item])
         return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.475)
        } else {
        return CGSize(width: collectionView.frame.size.width / 4, height: collectionView.frame.size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



