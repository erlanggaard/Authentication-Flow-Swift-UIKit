//
//  AccessToken.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 28/07/23.
//

import Foundation

// Response
// Decodable -> Protocol untuk mapping dari json/data ke object
struct AccessToken: Decodable {
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessToken = try container.decodeIfPresent(String.self, forKey: .accessToken) ?? ""
        self.refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken) ?? ""
    }
}
