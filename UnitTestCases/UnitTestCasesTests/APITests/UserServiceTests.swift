//
//  UserServiceTests.swift
//  UnitTestCasesTests
//
//  Created by Nitin Bhatt on 8/16/22.
//

import XCTest
@testable import UnitTestCases

class UserServiceTests: XCTestCase {

    func test_getContactDetails_APIResponse() {
        let expectation = XCTestExpectation(description: "ValidRequst_Returns_UserDetails")
      
        let contantAPIClient = UserService()
        
        contantAPIClient.getUsers { isSuccess,results,_  in
            if results!.count > 0{
                expectation.fulfill()
            }else{
                XCTFail("Data is nil")
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
