//
//  LoginViewController.swift
//  parseChat
//
//  Created by Gerard Recinto on 12/2/17.
//  Copyright © 2017 Gerard Recinto. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var usernameTextField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  @IBAction func onSignUpButton(_ sender: Any) {
   let newUser = PFUser()
    newUser.username = usernameTextField.text
    newUser.password = passwordTextField.text
   
    if ((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!){
      let alertController = UIAlertController(title: "Missing Information", message: "Username and Pasword required", preferredStyle: .alert)
      
    
      
      // create an OK action
      let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        // handle response here.
      }
      // add the OK action to the alert controller
      alertController.addAction(OKAction)
      present(alertController, animated: true) {
        // optional code for what happens after the alert controller has finished presenting
        print("alert has shown up")
      }
    }
    newUser.signUpInBackground { (success: Bool, error: Error?) in
      if let error = error {
        print(error.localizedDescription)
        let alertController = UIAlertController(title: "SignUp failed", message: "User sign up failed: \(error.localizedDescription)", preferredStyle: .alert)
        
        
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
          // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
          // optional code for what happens after the alert controller has finished presenting
          print("alert has shown up")
        }
      } else {
        print("User registered successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)

      }
    }
    
  }
  
  @IBAction func onLoginButton(_ sender: Any) {
  let username = usernameTextField.text ?? ""
  let password = passwordTextField.text ?? ""
    if ((usernameTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)!){
      let alertController = UIAlertController(title: "Missing Information", message: "Username and Pasword required", preferredStyle: .alert)
      
      
      
      // create an OK action
      let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
        // handle response here.
      }
      // add the OK action to the alert controller
      alertController.addAction(OKAction)
      present(alertController, animated: true) {
        // optional code for what happens after the alert controller has finished presenting
        print("alert has shown up")
      }
    }
    PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
      if let error = error {
        print("User log in failed: \(error.localizedDescription)")
        let alertController = UIAlertController(title: "Login failed", message: "User log in failed: \(error.localizedDescription)", preferredStyle: .alert)
        
        
        
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
          // handle response here.
        }
        // add the OK action to the alert controller
        alertController.addAction(OKAction)
        self.present(alertController, animated: true) {
          // optional code for what happens after the alert controller has finished presenting
          print("alert has shown up")
        }
      
      } else {
        print("User logged in successfully")
        self.performSegue(withIdentifier: "loginSegue", sender: nil)

        // display view controller that needs to shown after successful login
      }
    }
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  

}

