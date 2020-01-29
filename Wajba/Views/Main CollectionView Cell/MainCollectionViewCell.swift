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
        backgroundImage.setCornerRadius(cornerR: 8)
        topLabel.setCornerRadius(cornerR: 4)
        gradientView.setCornerRadius(cornerR: 8)
        graphicHelper.setGradient(view: gradientView)
    }
    

}
