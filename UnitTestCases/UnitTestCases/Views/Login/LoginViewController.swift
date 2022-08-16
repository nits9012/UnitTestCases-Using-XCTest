//
//  LoginViewController.swift
//  ContactApp
//
//  Created by Nitin Bhatt on 7/2/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        passwordTextField.isSecureTextEntry = true
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        guard let email = self.emailTextField.text else {return}
        guard let password = self.passwordTextField.text else {return}
        
        loginViewModel.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                let contactViewController = UserListViewController()
                contactViewController.modalPresentationStyle = .fullScreen
                self.present(contactViewController, animated: true, completion: nil)
            } else {
                self.showAlert(isSuccess: false, message: message)
            }
        }
        
        loginViewModel.validationUser(email, andPassword: password)
    }
    
    func showAlert(isSuccess:Bool,message:String){
        let alert = UIAlertController(title: (isSuccess == true) ? "Success" : "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
