//
//  UsersTest.swift
//  UnitTestCasesTests
//
//  Created by Nitin Bhatt on 8/16/22.
//

import XCTest
@testable import UnitTestCases

class UsersTest: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func test_UsersAPI_Response() {
        let expectation = XCTestExpectation(description: "ValidRequest_Returns_UserDetails")
        
        MockedHTTPClient().getUsers(completion: {user in
            if user!.count > 5{
                expectation.fulfill()
            }else{
                XCTFail("Data is nil")
            }
        })
        wait(for: [expectation], timeout: 1.0)
    }
    
    
    func test_UserProfileAPI_Response() {
        let expectation = XCTestExpectation(description: "ValidRequest_Returns_UserProfileDetails")
        
        MockedHTTPClient().getUserProfileDetails(completion: {user_details in
            XCTAssertEqual(user_details?.first_name, "John")
            XCTAssertEqual(user_details?.last_name, "Gates")
            XCTAssertEqual(user_details?.state, "california")
            XCTAssertEqual(user_details?.country, "USA")
            XCTAssertEqual(user_details?.gender, "male")
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 1.0)
    }
}
