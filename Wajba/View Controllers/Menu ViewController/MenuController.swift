//
//  MenuController.swift
//  Wajba
//
//  Created by C4Q on 1/26/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    // MARK: - Properties
    let graphicHelper = GraphicHelper()
    // MARK: - Outlets
//    @IBOutlet weak var backgroundImage: UIImageView!
    

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let background = UIImageView()
        background.image = graphicHelper.addBlurTo(image: #imageLiteral(resourceName: "Background"), radius: 75)
        view.addSubview(background)
        background.translatesAutoresizingMaskIntoConstraints = false
        background.topAnchor.constraint(equalTo: view.topAnchor, constant: -25).isActive = true
        background.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -25).isActive = true
        background.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        background.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private
    
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
