//
//  UserList.swift
//  UnitTestCases
//
//  Created by Nitin Bhatt on 8/16/22.
//

import Foundation

typealias UserLists = [UserList]


struct UserList: Codable {

    var id:Int
    let userEmail, userGender, userName, userStatus:String
   
        
    enum CodingKeys:String,CodingKey{
       case id
       case userEmail = "email"
       case userGender = "gender"
       case userName = "name"
       case userStatus = "status"
    }
}
