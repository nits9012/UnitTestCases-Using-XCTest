//
//  LoginViewModel.swift
//  ContactApp
//
//  Created by Nitin Bhatt on 7/3/22.
//

import Foundation

class LoginViewModel:NSObject{
    
    var user:UserLogin?
    
    var email:String{
        return user?.email ?? ""
    }
    
    var password:String{
        return user?.password ?? ""
    }
    
    typealias authenticationLoginCallback = (_ status:Bool, _ message:String) -> Void

    var loginCallback:authenticationLoginCallback?
    
    
    func validationUser(_ email:String, andPassword password:String){
        if email.count != 0{
            if password.count != 0{
                self.verifyUserWith(email: email, andPassword: password)
            } else {
                self.loginCallback?(false,"Password should not be empty")
            }
        }else{
            self.loginCallback?(false,"Username should not be empty")
        }
    }
    
    func verifyUserWith(email:String, andPassword password:String){
        if email == "test@test.com" && password == "123456"{
            user = UserLogin(email: email, password: password)
            self.loginCallback?(true, "User is successfully authenticated")
        }else{
            self.loginCallback?(false,"Please enter valid credentials")
        }
    }
    
    func loginCompletionHandler(callback: @escaping authenticationLoginCallback){
        self.loginCallback = callback
    }
}
