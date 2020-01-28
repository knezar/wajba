//
//  GraphicHelper.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class GraphicHelper: NSObject {

    override init(){
        super.init()
    }
    
    func blurBackground(imageView: UIImageView) {
         let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        imageView.insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([
        blurView.heightAnchor.constraint(equalTo: imageView.heightAnchor),
        blurView.widthAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
    }
    
    func setupTextFieldPalceHolder(textField: UITextField, text: String) {
        let attrs =  [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: attrs)
    }
    
    func setGradient (view: UIView) {
         let tintLayer = CAGradientLayer()
        tintLayer.frame = view.bounds
        tintLayer.colors = [UIColor.clear.cgColor, UIColor(white: 0, alpha: 0.65).cgColor]
        tintLayer.locations = [0.0, 1.0]
        view.layer.addSublayer(tintLayer)
     }
}
