//
//  RequestInterceptor.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 15/08/23.
//

import Foundation
import Alamofire

class RequestInterceptor: Alamofire.RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        
        if let accessToken = AccessTokenRepository.shared.accessToken {
            urlRequest.setValue("Bearer \(accessToken.accessToken)", forHTTPHeaderField: "Authorization")
        }
        completion(.success(urlRequest))
        
        
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let response = request.task?.response as? HTTPURLResponse
        if let statusCode = response?.statusCode, statusCode == 401,
           let accessToken = AccessTokenRepository.shared.accessToken {
            AccessTokenRepository.shared.accessToken = nil
            AuthRepository.shared.refreshToken(accessToken.refreshToken) { (error) in
                if error == nil {
                    completion(.retry)
                }
                else {
                    return completion(.doNotRetry)
                }
            }
        } else {
            return completion(.doNotRetry)
        }
    }
    
    
}
