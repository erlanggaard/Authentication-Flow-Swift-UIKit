//
//  User.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 15/08/23.
//

import Foundation

struct User: Decodable {
    let id: Int
    let email: String
    let password: String
    let name: String
    let role: String
    let avatar: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case password
        case name
        case role
        case avatar
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
        self.email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        self.password = try container.decodeIfPresent(String.self, forKey: .password) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.role = try container.decodeIfPresent(String.self, forKey: .role) ?? ""
        self.avatar = try container.decodeIfPresent(String.self, forKey: .avatar) ?? ""
    }
    
    
}
