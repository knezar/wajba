//
//  GraphicHelper.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit
//import CoreImage
//import CoreGraphics
//import Darwin

class GraphicHelper: NSObject {

    override init(){
        super.init()
    }
    
    func addBlurTo(image: UIImage, radius: CGFloat) -> UIImage {
        let ciContext = CIContext(options: nil)
        guard let inputImage = CIImage(image: image) else {return image}
        guard let gaussianBlurFilter = CIFilter(name: "CIGaussianBlur") else { return image }
        gaussianBlurFilter.setValue(inputImage, forKey: kCIInputImageKey)
        gaussianBlurFilter.setValue(radius, forKey: "inputRadius")

        guard let blurdImage = gaussianBlurFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return image }
        guard let monochromeFilter = CIFilter(name: "CIExposureAdjust") else { return image }
        monochromeFilter.setValue(blurdImage, forKey: kCIInputImageKey)
        monochromeFilter.setValue(-0.5, forKey: "inputEV")
        guard let resultImage2 = monochromeFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return image }
        guard let cgImage2 = ciContext.createCGImage(resultImage2, from: inputImage.extent) else { return image }
        return UIImage(cgImage: cgImage2)
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
