//
//  LoginViewController.swift
//  DeepDa
//
//  Created by Luyan on 2021/09/10.
//

import UIKit

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
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        
    }
    
    
    @IBAction func didTapLoginButton() {
        guard let username = identifierTextField.text,
              let password = passwordTextField.text
        else { return }
        
        print(username)
        print(password)
        if username == password {
            self.performSegue(withIdentifier: "loginSuccess", sender: self)
        }
    }
}
