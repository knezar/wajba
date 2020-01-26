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
    var delegate: LoginControllerDelegate?

    // MARK: - Outlets
    @IBOutlet weak var signinButton: UIButton!
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
        
        setupTextFieldPalceHolder(textField: userNameTextField, text: "Email")
        setupTextFieldPalceHolder(textField: passwordTextField, text: "Password")
    }
    private func setupBackGroundblur() {
        backgroundImage.image = #imageLiteral(resourceName: "Background").blurred(radius: 14)
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
        
        dismiss(animated: true, completion: nil)
        delegate?.finishLoggingIn()
    }
    
    @IBAction func didPressCreateAccount(_ sender: UIButton) {
        let signupViewController = SignupViewController()
        signupViewController.modalPresentationStyle = .fullScreen
        present(signupViewController, animated: true, completion: nil)
    }
    
    @IBAction func didPressNeedHelp(_ sender: UIButton) {
        let resetViewController = ResetViewController()
        resetViewController.modalPresentationStyle = .fullScreen
        present(resetViewController, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
