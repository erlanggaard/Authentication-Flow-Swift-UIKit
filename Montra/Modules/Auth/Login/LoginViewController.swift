//
//  LoginViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 19/07/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var passwordTextField: InputTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        showSignUpViewController()
    }
    
    @IBAction func forgotButtonPressed(_ sender: Any) {
        showForgotPasswordViewController()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func setup() {
        passwordTextField.rightImageTapped = {
            self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
        }
    }
}

