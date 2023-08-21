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
        let interceptor = RequestInterceptor()
        let logger = NetworkLogger()
        
        return Session(configuration: config, interceptor: interceptor, eventMonitors: [logger])
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
    
    
    func getProfile(completion: @escaping (Result<User, Error>) -> Void) {
        let fullUrl = "\(BASE_URL)/api/v1/auth/profile"
        
        sessionManager.request(fullUrl, method: .get)
            .validate()
            .responseDecodable(of: User.self) { response in
                switch response.result {
                case .success(let user):
                    completion(.success(user))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func refreshToken(_ refreshToken: String, completion: @escaping (Result<AccessToken, Error>) -> Void) {
        let fullUrl = "\(BASE_URL)/api/v1/auth/refresh-token"
        
        sessionManager.request(fullUrl, method: .post, parameters: ["refreshToken" : refreshToken])
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
