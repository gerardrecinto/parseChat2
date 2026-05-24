//
//  LoginViewController.swift
//  parseChat
//
//  Created by Gerard Recinto on 12/2/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit

@MainActor
class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        if LocalChatService.shared.isLoggedIn {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }

    @IBAction func onSignUpButton(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        do {
            try LocalChatService.shared.signup(username: username, password: password)
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } catch {
            showAlert(title: "Sign Up Failed", message: error.localizedDescription)
        }
    }

    @IBAction func onLoginButton(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        do {
            try LocalChatService.shared.login(username: username, password: password)
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } catch {
            showAlert(title: "Login Failed", message: error.localizedDescription)
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
