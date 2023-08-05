//
//  AccessTokenRepository.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 05/08/23.
//

import Foundation
import Valet

class AccessTokenRepository {
    static var shared: AccessTokenRepository = AccessTokenRepository()
    private init() { }
    
    private let kAccessTokenKey: String = "\(Bundle.main.bundleIdentifier!).kAccessTokenKey"
    private let kRefreshTokenKey: String = "\(Bundle.main.bundleIdentifier!).kRefreshTokenKey"
    
    private lazy var valet: Valet = {
        let valet = Valet.valet(with: Identifier(nonEmpty: Bundle.main.bundleIdentifier)!, accessibility: .afterFirstUnlock)
        
        return valet
    }()
    
    
    var accessToken: AccessToken? {
        get {
            if let accessToken = try? valet.string(forKey: kAccessTokenKey),
               let refreshToken = try? valet.string(forKey: kRefreshTokenKey) {
                return AccessToken(accessToken: accessToken, refreshToken: refreshToken)
            }
            else {
                return nil
            }
        }
        
        set {
            if let accessToken = newValue {
                try? valet.setString(accessToken.accessToken, forKey: kAccessTokenKey)
                try? valet.setString(accessToken.refreshToken, forKey: kRefreshTokenKey)
            }
            else {
                try? valet.removeObject(forKey: kAccessTokenKey)
                try? valet.removeObject(forKey: kRefreshTokenKey)
            }
        }
    }
}
