//
//  AuthRepository.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 28/07/23.
//

import Foundation

class AuthRepository {
    static var shared: AuthRepository = AuthRepository()
    private init () { }
    
    func login(email: String, password: String, completion: @escaping (Error?) -> Void) {
        let request = LoginRequest(email: email, password: password)
        
        ApiService.shared.login(request: request) { result in
            switch result {
            case .success(let accessToken):
                // TODO: Save access Token
                AccessTokenRepository.shared.accessToken = accessToken
                completion(nil)
                
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func refreshToken(_ refreshToken: String, completion: @escaping (Error?) -> Void) {
        ApiService.shared.refreshToken(refreshToken) { result in
            switch result {
            case .success(let accessToken):
                AccessTokenRepository.shared.accessToken = accessToken
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
}
