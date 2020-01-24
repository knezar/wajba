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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        title = "Wajba"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurMenuBar()
        configureMainCollectionView()
        graphicHelper.blurBackground(imageView: backgroundImage)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)

        //navigationItem.setHidesBackButton(true, animated: false)
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.4)
        } else {
        return CGSize(width: collectionView.frame.size.width / 4, height: collectionView.frame.size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
