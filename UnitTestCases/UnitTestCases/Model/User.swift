//
//  User.swift
//  UnitTestCases
//
//  Created by Nitin Bhatt on 8/16/22.
//


typealias Users = [User]

struct User: Decodable {
    let id:Int?
    let name:String?
    let gender:String?
    let status:String?
}

struct UserProfile: Decodable {
    let first_name:String?
    let last_name:String?
    let gender:String?
    let country:String?
    let state:String?
}


struct UserLogin{
    var email:String?
    var password:String?
}
