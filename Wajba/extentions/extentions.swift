//
//  extentions.swift
//  Wajba
//
//  Created by C4Q on 1/19/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit
extension UIColor {
    static func getRGB(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
extension UIImage {
    func blurred(radius: CGFloat) -> UIImage {
        let ciContext = CIContext(options: nil)
        guard let cgImage = cgImage else { return self }
        let inputImage = CIImage(cgImage: cgImage)
        guard let gaussianBlurFilter = CIFilter(name: "CIGaussianBlur") else { return self }
        gaussianBlurFilter.setValue(inputImage, forKey: kCIInputImageKey)
        gaussianBlurFilter.setValue(radius, forKey: "inputRadius")

        guard let blurdImage = gaussianBlurFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return self }
        guard let monochromeFilter = CIFilter(name: "CIExposureAdjust") else { return self }
        monochromeFilter.setValue(blurdImage, forKey: kCIInputImageKey)
        monochromeFilter.setValue(-0.5, forKey: "inputEV")
        guard let resultImage2 = monochromeFilter.value(forKey: kCIOutputImageKey) as? CIImage else { return self }
        guard let cgImage2 = ciContext.createCGImage(resultImage2, from: inputImage.extent) else { return self }
        return UIImage(cgImage: cgImage2)
    }
}
