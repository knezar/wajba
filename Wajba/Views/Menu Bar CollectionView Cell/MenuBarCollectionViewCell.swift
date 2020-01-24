//
//  MenuBarCollectionViewCell.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MenuBarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var menuBarLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        menuBarLabel.layer.masksToBounds = true
        menuBarLabel.layer.cornerRadius = 20
        menuBarLabel.backgroundColor = UIColor.getRGB(red: 128, green: 29, blue: 30)
        self.backgroundColor = UIColor.clear
        menuBarLabel.textColor = UIColor.white
    }

}
