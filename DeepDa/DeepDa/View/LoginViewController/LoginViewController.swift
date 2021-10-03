//
//  LoginViewController.swift
//  DeepDa
//
//  Created by Luyan on 2021/09/10.
//

import UIKit
import FirebaseAuth

class LoginViewController: UITableViewController, BaseViewControllerable {
    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        
    }
    
    
    @IBAction func didTapLoginButton() {
        guard let username = identifierTextField.text,
              let password = passwordTextField.text
        else { return }
        
        Auth.auth().signIn(withEmail: username, password: password, completion: { (user, error) in
            if user != nil {
                print("login success")
                if username == password {
                    self.performSegue(withIdentifier: "loginSuccess", sender: self)
                }
            } else {
                print("login fail")
            }
        })
    }
}
