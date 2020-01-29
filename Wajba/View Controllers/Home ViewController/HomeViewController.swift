//
//  HomeViewController.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties

    let imageItems = ["Rec-1", "Rec-2", "Rec-3", "Rec-4", "Rec-5"]
    let titleItems = ["Chermoula couscous", "Flaky chicken and almond pie", "Chermoula eggplant", "Garam masala bastilla", "Goat tagine with almonds"]
    let graphicHelper = GraphicHelper()
    var delegate: HomeControllerDelegate?
    let mainCollectionCellID = "mainCollectionCell"
    lazy var menuBar: MenuBarView = {
          let mb = MenuBarView()
          mb.isHidden = false
          return mb
      }()

    // MARK: - Outlets

    @IBOutlet weak var mainCollectionView: UICollectionView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMenuBar()
        configureMainCollectionView()
        configureNavItems()
        backgroundImage.image = graphicHelper.addBlurTo(image: #imageLiteral(resourceName: "Background"), radius: 14)
        navigationItem.title = "Wajba"
    }
    
    // MARK: - Private
    func configureMenuBar() {
        view.addSubview(menuBar)
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        menuBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func configureNavItems() {
        navigationItem.leftBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Menu Icon"), selector: #selector (handleMenuButtonPressed))
        navigationItem.rightBarButtonItem =  navButtonConfiguration(image: #imageLiteral(resourceName: "Search Icon"), selector: #selector (handleSearchButtonPressed))
    }
    
    func navButtonConfiguration(image: UIImage, selector: Selector) -> UIBarButtonItem {
        let barButton = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: selector)
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
    
    // MARK: - Actions

    @objc func handleSearchButtonPressed() {
        print("search button pressed")
    }
    
    @objc func handleMenuButtonPressed() {
//        UserDefaultsHelper.manager.setIsLoggedIn(bool: false)
//        delegate?.finishLoggingOut()
//        dismiss(animated: true, completion: nil)
        
        delegate?.slideOutMenuToggled()
    }
}
    // MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {

}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCollectionCellID, for: indexPath) as! MainCollectionViewCell
            cell.titleLabel.text = titleItems[indexPath.item]
            cell.backgroundImage.image = UIImage(named: imageItems[indexPath.item])
         return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height * 0.4)
    }
}
