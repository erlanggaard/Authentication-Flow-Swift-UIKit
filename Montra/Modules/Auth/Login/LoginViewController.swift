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
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        login()
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
    
    func login() {
        let email = emailTextField.text ?? ""
        let pass = passwordTextField.text ?? ""
        
        AuthRepository.shared.login(email: email, password: pass) { [weak self] (error) in
            if let error = error {
                self?.showErrorAlert(message: "Email atau Password salah!")
            }
            else {
                UserRepository.shared.getProfile { (result) in
                    switch result {
                    case .success(let user):
                        self?.showAlert(title: "Get Profile", message: "Get Profile Success")
                    case .failure(let error):
                        self?.showErrorAlert(message: error.localizedDescription)
                    }
                }
//                self?.showAlert(title: "Login", message: "Login Success!")
            }
        }
    }
    
    
    
}

