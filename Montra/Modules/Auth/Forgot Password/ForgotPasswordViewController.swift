//
//  ForgotPasswordViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 19/07/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextfield: InputTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        continueResetPassword()
    }
    
    func continueResetPassword() {
        guard let email = emailTextfield.text, email.isEmail else {
            showErrorAlert(message: "Email is not valid, Please Check Again!")
            return
        }
        showContinueForgotPasswordViewController(email: email)
    }
}
