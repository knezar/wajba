//
//  TextFieldEdgeInset.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class TextFieldEdgeInset: UITextField {

  let padding = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.inset(by: padding)
  }
}
