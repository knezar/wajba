//
//  ResetViewController.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class ResetViewController: UIViewController {
    // MARK: - Properties
    let graphicHelper = GraphicHelper()

    // MARK: - Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTextFields()
    }
    
    // MARK: - Private
    func configureTextFields() {
        emailTextField.delegate = self
        setupTextFieldPalceHolder(textField: emailTextField, text: "Email")
        backgroundImage.image = graphicHelper.addBlurTo(image: #imageLiteral(resourceName: "Background"), radius: 14)
         self.navigationController?.setNavigationBarHidden(true, animated: true)
     }
    func setupTextFieldPalceHolder(textField: UITextField, text: String) {
        let attrs =  [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: attrs)
    }
    
    // MARK: - Actions
    @IBAction func didPressReset(_ sender: UIButton) {
//        self.navigationController?.popToRootViewController(animated: true)
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
}

extension ResetViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
