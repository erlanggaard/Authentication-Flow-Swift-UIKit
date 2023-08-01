//
//  LoginRequest.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 28/07/23.
//

import Foundation

// Request
// Encodable -> Protocol untuk convert objek menjadi data, dimana data digunakan untuk request
struct LoginRequest: Encodable {
    let email: String
    let password: String
}
