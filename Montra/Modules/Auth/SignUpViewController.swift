//
//  SignUpViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 09/07/23.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var passwordTextField: InputTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
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
    func showSignUpViewController() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "signUp")
        
        navigationController?.pushViewController(ViewController, animated: true)
    }
}
