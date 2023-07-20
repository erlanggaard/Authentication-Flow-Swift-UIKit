//
//  ExtenstionUIViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 18/07/23.
//

import UIKit

extension UIViewController {
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK!", style: .default))
        present(alert, animated: true)
    }
    
    func showSignUpViewController() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "signUp")
        
        navigationController?.pushViewController(ViewController, animated: true)
    }

    func showLoginViewController() {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "login")
        
        navigationController?.pushViewController(ViewController, animated: true)
    }
    
    func showVerificationViewController() {
        let storyboard = UIStoryboard(name: "Verification", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "verification")
        
        navigationController?.pushViewController(viewController, animated: true)
    }

    func showForgotPasswordViewController() {
        let storyboard = UIStoryboard(name: "ForgotPassword", bundle: nil)
        let ViewController = storyboard.instantiateViewController(withIdentifier: "forgotPassword")
        
        navigationController?.pushViewController(ViewController, animated: true)
    }
    
}
