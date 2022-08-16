//
//  MockedHTTPClient.swift
//  UnitTestCasesTests
//
//  Created by Nitin Bhatt on 8/16/22.
//

import XCTest
@testable import UnitTestCases

class MockedHTTPClient{
    func getUsers(completion: @escaping (Users?) -> Void) {
        guard let url = Bundle(for: MockedHTTPClient.self).url(forResource: "UserResponse", withExtension: "json") else{
            return completion(nil)
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return completion(nil)
        }
        
        guard let user = try? JSONDecoder().decode(Users.self, from: data) else {
            return completion(nil)
        }
        
        completion(user)
    }
    
    
    func getUserProfileDetails(completion: @escaping (UserProfile?) -> Void) {
        guard let url = Bundle(for: MockedHTTPClient.self).url(forResource: "UserProfileResponse", withExtension: "json") else{
            return completion(nil)
        }

        guard let data = try? Data(contentsOf: url) else {
            return completion(nil)
        }
        
        guard let user = try? JSONDecoder().decode(UserProfile.self, from: data) else {
            return completion(nil)
        }
        completion(user)
    }
}
