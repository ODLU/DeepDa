//
//  ViewController.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/09/10.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UITableViewController {
    
    // MARK: Interface Builders
    @IBOutlet weak var identifierTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    @IBOutlet weak var NicknameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationItem.backButtonTitle = "되돌아가기"
    }
}

private extension SignUpViewController {
    func signUp() {
        
    }
}

