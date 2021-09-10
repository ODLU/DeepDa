//
//  LoginViewController.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/09/10.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func setup() {
        self.view = LoginView()
        self.navigationController?.navigationBar.isHidden = true
    }
}
