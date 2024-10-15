//
//  LoginViewUITests.swift
//  UnitTestCasesUITests
//
//  Created by Nitin Bhatt on 10/15/24.
//

import XCTest
@testable import UnitTestCases

class LoginViewUITests: XCTestCase {
    private var app: XCUIApplication!
    private var emailTextField: XCUIElement!
    private var passwordTextField: XCUIElement!
    private var loginButton: XCUIElement!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        emailTextField = app.textFields["login-email-textfield"]
        passwordTextField = app.secureTextFields["login-password-textfield"]
        loginButton = app.buttons["login-button"]
    }
    
    override func tearDownWithError() throws {
        app = nil
        emailTextField = nil
        passwordTextField = nil
        loginButton = nil
    }
    
    
    func testV2LoginViewController_WhenValidFormSubmitted() throws {
        emailTextField.tap()
        emailTextField.typeText(TestAccount().login_email)
        
        passwordTextField.tap()
        passwordTextField.typeText(TestAccount().password)

        loginButton.tap()
        sleep(4)
        app.buttons["menuIcon"].tap()
    }
}


// Testing deafult credentails
struct TestAccount{
    var login_email = "test@test.com"
    var login_unverified_email = "test@gmail.com"
    var password  = "123456"
}
