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
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func setup() {
        passwordTextField.rightImageTapped = {
            self.passwordTextField.isSecureTextEntry = !self.passwordTextField.isSecureTextEntry
        }
    }
}

extension UIViewController {
    func showLoginViewController() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "login")
        
        navigationController?.pushViewController(ViewController, animated: true)
    }
}
