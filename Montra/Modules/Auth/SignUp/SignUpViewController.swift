//
//  SignUpViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 09/07/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: InputTextField!
    @IBOutlet weak var nameTextField: InputTextField!
    @IBOutlet weak var passwordTextField: InputTextField!
    @IBOutlet weak var agreeButton: CheckButton!
    @IBOutlet weak var termsAndConditionLabel: UILabel!
    @IBOutlet weak var signUpButton: PrimaryButton!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var googleButton: GhostButton!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginButton: UnderlineButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    func signUp() {
        // Checking Name Format
//        guard let name = nameTextField.text, name.count >= 3 else {
//            showErrorAlert(message: "Name At Least Must Be More than 3 Characters")
//            return
//        }
        
        // Checking Email Format
//        guard let email = emailTextField.text, email.isEmail else {
//            showErrorAlert(message: "Email is not valid, Please Check Again!")
//            return
//        }
        let email = emailTextField.text
        
        // Checking Password Format
//        guard let password = passwordTextField.text, password.isStrongPassword else {
//            showErrorAlert(message: "Password must have Minimum 8 characters at least 1 Number")
//            return
//        }
        
        // Checking Agree Button
//        guard agreeButton.isChecked else {
//            showErrorAlert(message: "Please check Terms of Service and Privacy Policy")
//            return
//        }
        
        showVerificationViewController(email: email ?? "")
    }
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        showLoginViewController()
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        signUp()
    }
    
    @IBAction func agreeButtonPressed(_ sender: Any) {
        agreeButton.isChecked = !agreeButton.isChecked
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func setup() {
        passwordTextField.rightImageTapped = {
            self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
        }
        
        let attText = NSMutableAttributedString(
            string: "By signing up, you agree to the ",
            attributes: [
                .font: UIFont.systemFont(ofSize: 14, weight: .medium),
                .foregroundColor: UIColor(named: "Dark50")!
            ]
        )
        attText.append(
            NSAttributedString(
                string: "Terms of Service and Privacy Policy",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 14, weight: .medium),
                    .foregroundColor: UIColor(named: "Violet100")!
                ]
            )
        )
        termsAndConditionLabel.attributedText = attText
    }
}

