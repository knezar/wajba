//
//  MainCollectionViewCell.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    let graphicHelper = GraphicHelper()
    
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundImage.layer.masksToBounds = true
        backgroundImage.layer.cornerRadius = 10
        topLabel.layer.masksToBounds = true
        topLabel.layer.cornerRadius = 4
        graphicHelper.setGradient(view: gradientView)
    }

}
