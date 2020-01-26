//
//  MainMenuViewController.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    
    let graphicHelper = GraphicHelper()
    var delegate: LoginControllerDelegate?
    let mainCollectionCellID = "mainCollectionCell"
    lazy var menuBar: MenuBarView = {
          let mb = MenuBarView()
          mb.isHidden = false
          return mb
      }()

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMenuBar()
        configureMainCollectionView()
        configureNavItems()
        backgroundImage.image = #imageLiteral(resourceName: "Background").blurred(radius: 14)
        navigationItem.title = "Wajba"
    }
    
    func configureMenuBar() {
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
    
    func configureMainCollectionView() {
        self.mainCollectionView.register(UINib(nibName:"MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: mainCollectionCellID)
        self.mainCollectionView.delegate = self
        self.mainCollectionView.dataSource = self
        mainCollectionView.backgroundColor = UIColor.clear
        mainCollectionView.showsVerticalScrollIndicator = false
        
        view.addSubview(mainCollectionView)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.topAnchor.constraint(equalTo: menuBar.bottomAnchor, constant: 10).isActive = true
        mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
        delegate?.finishLoggingOut()
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCollectionCellID, for: indexPath) as! MainCollectionViewCell
            cell.titleLabel.text = titleItems[indexPath.item]
            cell.backgroundImage.image = UIImage(named: imageItems[indexPath.item])
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.4)
    }
}



