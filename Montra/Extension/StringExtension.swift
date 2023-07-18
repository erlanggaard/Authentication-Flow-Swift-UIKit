//
//  StringExtension.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 18/07/23.
//

import Foundation

extension String {
    var isEmail: Bool {
        let regexEmail = "[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}"
        let test = NSPredicate(format: "SELF MATCHES %@", regexEmail)
        return test.evaluate(with: self)
    }
    
    var isStrongPassword: Bool {
        let regexPassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let test = NSPredicate(format: "SELF MATCHES %@", regexPassword)
        
        return test.evaluate(with: self)
    }
}
