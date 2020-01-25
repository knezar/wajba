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
        
        setCornerRadius(view: backgroundImage, cornerR: 8)
        setCornerRadius(view: topLabel, cornerR: 4)
        setCornerRadius(view: gradientView, cornerR: 8)
        graphicHelper.setGradient(view: gradientView)
    }
    
    private func setCornerRadius(view: UIView, cornerR: CGFloat) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerR
    }
}
