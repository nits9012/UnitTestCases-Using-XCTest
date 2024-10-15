//
//  LoginViewTests.swift
//  ContactAppTests
//
//  Created by Nitin Bhatt on 7/3/22.
//
import XCTest
@testable import UnitTestCases

class LoginViewTests: XCTestCase {
    
    var controller = LoginViewController()
    
    override func setUp() {
        controller.loadViewIfNeeded()
    }

    override func tearDown() {
    }
    
    func test_isValidEmail(){
        XCTAssertTrue(controller.isValidEmail("test@gmail.com"))
    }
    
    func test_isInvalidEmail(){
        XCTAssertFalse(controller.isValidEmail("test@@@#$@gmail.com"))
    }
    
    
    // Mark: UI elements tests
    func test_WhenCreated_TextFields_HasDefaultValues(){
        XCTAssertEqual(controller.emailTextField.text, "")
        XCTAssertEqual(controller.passwordTextField.text, "")
    }

    // Validate button actions and outlet
    func testLoginView_WhenCreated_HasLoginButtonAndAction() throws{
        // Arrange
        let loginButton:UIButton = try XCTUnwrap(controller.loginButton,"The login button is not connect to an IBOutlet")

        //Act
        let loginButtonActions = loginButton.actions(forTarget: controller, forControlEvent: .touchUpInside)

        //Assert
        XCTAssertEqual(loginButtonActions?.count,1, "Login button does not have any actions assigned to it")
        XCTAssertEqual(loginButtonActions?.first, "loginButtonAction:","There is no action with a name loginButtonAction assigned to login button")
    }
}
