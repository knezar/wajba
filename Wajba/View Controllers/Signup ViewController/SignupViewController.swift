//
//  SignupViewController.swift
//  Wajba
//
//  Created by C4Q on 1/21/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Properties
    let graphicHelper = GraphicHelper()

    // MARK: - Outlets
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//    // Hide the Navigation Bar
//            self.navigationController?.setNavigationBarHidden(false, animated: true)
//        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureTextFields()

    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(true)
//    // Show the Navigation Bar
//            self.navigationController?.setNavigationBarHidden(true, animated: false)
//        }

    // MARK: - Private
       func configureTextFields() {
            emailTextField.delegate = self
            passwordTextField.delegate = self
            firstNameTextField.delegate = self
            lastNameTextField.delegate = self
        
        graphicHelper.blurBackground(imageView: backgroundImage)
        setupTextFieldPalceHolder(textField: emailTextField, text: "Email")
        setupTextFieldPalceHolder(textField: passwordTextField, text: "Password")
        setupTextFieldPalceHolder(textField: firstNameTextField, text: "First Name")
        setupTextFieldPalceHolder(textField: lastNameTextField, text: "Last Name")
            
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

    @IBAction func didPressSignIn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didPressNeedHelp(_ sender: UIButton) {
        let resetViewController = ResetViewController()
        navigationController?.pushViewController(resetViewController, animated: true)
    }
    
    
}



extension SignupViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
