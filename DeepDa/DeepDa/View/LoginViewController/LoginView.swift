//
//  LoginView.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/09/10.
//

import UIKit
import SnapKit

class LoginView: BaseView {
    enum Constant {
        static let margin: CGFloat = 10
    }
    
    private let containerTableView: UITableView = {
        let tableView = UITableView()
        
        
        return tableView
    }()
    
    private let identifierTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력하세요."
        textField.keyboardType = .default
        textField.textContentType = .username
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력하세요."
        textField.keyboardType = .default
        textField.textContentType = .password
        return textField
    }()
    
    private let mainLogoImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override func setup() {
        self.backgroundColor = .white
        addSubviews(mainLogoImage,identifierTextField, passwordTextField)
    }
    override func setupUI() {
        NSLayoutConstraint.activate([identifierTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     identifierTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     passwordTextField.centerXAnchor.constraint(equalTo: identifierTextField.centerXAnchor),
                                     passwordTextField.topAnchor.constraint(equalTo: identifierTextField.bottomAnchor, constant: Constant.margin)])
    }
}
