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
    
    func blurImage(usingImage image: UIImage, blurAmount : CGFloat) -> UIImage? {
        guard let ciImage = CIImage(image: image) else {return nil}
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(ciImage, forKey: kCIInputImageKey)
        blurFilter?.setValue(blurAmount, forKey: kCIInputRadiusKey)
        
        guard let outputImage = blurFilter?.outputImage else {return nil}
        
        
        return UIImage(ciImage: outputImage)
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

    func setNavBarImages(image: UIImage) -> UIBarButtonItem {
        let imageView = UIImageView()
        imageView.image = image.withRenderingMode(.alwaysOriginal)
        imageView.isUserInteractionEnabled = false
        let button = UIButton(type: .custom)
        button.adjustsImageWhenHighlighted = true
        button.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let navItem = UIBarButtonItem(customView: button)
        return navItem
    }
}
