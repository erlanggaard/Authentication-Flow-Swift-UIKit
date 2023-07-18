//
//  VerificationViewController.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 18/07/23.
//

import UIKit

class VerificationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    func showVerificationViewController() {
        let storyboard = UIStoryboard(name: "Verification", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "verification")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
