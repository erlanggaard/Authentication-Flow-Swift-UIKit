//
//  NetworkLogger.swift
//  Montra
//
//  Created by Erlangga Ardiansyah on 21/08/23.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
    
    func requestDidFinish(_ request: Request) {
        if let request = request.request {
            print("----------------------")
            print("reguest: \(request.url!)")
            print("headers: \(request.allHTTPHeaderFields!)")
            print("method: \(request.httpMethod!)")
            
            if let httpBody = request.httpBody {
                if let result = try? JSONSerialization.jsonObject(with: httpBody, options: []) as? [String: AnyObject] {
                    print("body: \(String(describing: result))")
                } else if let resultString = String(data: httpBody, encoding: .utf8) {
                    print("body: \(String(describing: resultString))")
                }
                else {
                    print(httpBody.debugDescription)
                }
            }
        }
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else {
            return
        }
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print("response: \(json)")
        }
    }
    
}
