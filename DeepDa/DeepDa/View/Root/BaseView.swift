//
//  BaseView.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/09/10.
//

import UIKit

class BaseView: UIView, BaseViewable {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func setup() {
        self.contentMode = .center
    }
    
    func setupUI() {
        self.backgroundColor = .clear
    }
}
