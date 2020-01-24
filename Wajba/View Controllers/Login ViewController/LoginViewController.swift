//
//  LoginViewController.swift
//  Wajba
//
//  Created by C4Q on 1/19/20.
//  Copyright © 2020 FoodTech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
        
    // MARK: - Properties
    let graphicHelper = GraphicHelper()

    // MARK: - Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTextFields()
        setupBackGroundblur()
    }
    // MARK: - Private
    private func configureTextFields() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        setupTextFieldPalceHolder(textField: userNameTextField, text: "Emailss")
        setupTextFieldPalceHolder(textField: passwordTextField, text: "Password")
    }
    private func setupBackGroundblur() {
        graphicHelper.blurBackground(imageView: backgroundImage)
    }
    private func setupTextFieldPalceHolder(textField: UITextField, text: String) {
        let attrs =  [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: attrs)
    }

    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        guard
        let userName = userNameTextField.text,
        let password = passwordTextField.text
        else {return}
        let parameters = ["email": userName, "password":password]
        
        let mainMenuViewController = MainMenuViewController()
               navigationController?.pushViewController(mainMenuViewController, animated: true)
    }
    
    @IBAction func didPressCreateAccount(_ sender: UIButton) {
        let signupViewController = SignupViewController()
        navigationController?.pushViewController(signupViewController, animated: true)
    }
    
    @IBAction func didPressNeedHelp(_ sender: UIButton) {
        let resetViewController = ResetViewController()
        navigationController?.pushViewController(resetViewController, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
