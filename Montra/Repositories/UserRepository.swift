//
//  UserRepository.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 15/08/23.
//

import Foundation

class UserRepository {
    static let shared: UserRepository = UserRepository()
    private init() { }
    
    func getProfile(completion: @escaping (Result<User, Error>) -> Void) {
        ApiService.shared.getProfile(completion: completion)
    }
}
