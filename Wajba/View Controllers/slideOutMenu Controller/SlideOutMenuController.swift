//
//  MenuController.swift
//  Wajba
//
//  Created by C4Q on 1/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SlideOutMenuController: UIViewController {
    
    // MARK: - Properties
    let options = ["ALL", "TRENDING", "NEW", "FAVORITES"]
    let graphicHelper = GraphicHelper()
    lazy var background: UIImageView = {
        let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = graphicHelper.addBlurTo(image: #imageLiteral(resourceName: "Background"), radius: 50)
        return imageView
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.backgroundColor = .clear
        tv.separatorColor = .clear
        return tv
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width*0.6).isActive = true
    }
    func setupBackgroundView() {
        view.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: view.topAnchor, constant: -50).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -50).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
    }
    // MARK: - Handlers
    // MARK: - Private
    // MARK: - Navigation
}

// MARK: - TableViewDelegate
extension SlideOutMenuController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        }
}
// MARK: - TableViewDataSource
extension SlideOutMenuController: UITableViewDataSource {
//    head
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)

        if  indexPath.row == options.count{
            cell.textLabel?.text = " SignOut "
            cell.textLabel?.textColor = UIColor(white: 1, alpha: 0.5)
        }else {
            cell.textLabel?.text = options[indexPath.row]
            cell.textLabel?.textColor = .white
        }
        return cell
    }
    
    
}
