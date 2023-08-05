//
//  ApiService.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 28/07/23.
//

import Foundation
import Alamofire

class ApiService {
    
    static var shared: ApiService = ApiService()
    private init() { }
    
    // Session Manager untuk melakukan request
    lazy var sessionManager: Session = {
        let config = URLSessionConfiguration.af.default
        config.timeoutIntervalForRequest = 30
        
        return Session(configuration: config)
    }()
    
    private let BASE_URL = "https://api.escuelajs.co"
    
    // LOGIN
    func login(request:LoginRequest, completion: @escaping (Result<AccessToken, Error>) -> Void) {
        let fullUrl = "\(BASE_URL)/api/v1/auth/login"
        
        sessionManager.request(fullUrl, method: .post, parameters: request)
            .validate()
            .responseDecodable(of: AccessToken.self) { response in
                switch response.result {
                case .success(let accessToken):
                    completion(.success(accessToken))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
