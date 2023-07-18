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
    
}
