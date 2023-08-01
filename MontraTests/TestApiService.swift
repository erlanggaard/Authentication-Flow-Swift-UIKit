//
//  TestApiService.swift
//  MontraTests
//
//  Created by Erlangga Ardiansyah on 01/08/23.
//

import XCTest
@testable import Montra

final class TestApiService: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLogin() throws {
        let expectation = XCTestExpectation(description: "Test Success Login")
        let request = LoginRequest(email: "john@mail.com", password: "changeme")
        
        ApiService.shared.login(request: request) { result in
            switch result {
            case .success(let accessToken):
                XCTAssert(!accessToken.accessToken.isEmpty, "Access Token is Empty!")
                XCTAssert(!accessToken.refreshToken.isEmpty, "Refresh Token is Empty!")
                
                print("--------TEST LOGIN IS PASSED!--------")
                
            case .failure(let error):
                print(error.localizedDescription)
                XCTAssert(false, error.localizedDescription)
            }
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
