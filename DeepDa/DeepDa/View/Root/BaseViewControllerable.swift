//
//  BaseViewControllable.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/09/10.
//

import UIKit

protocol BaseViewControllerable {
    func setup()
}

extension BaseViewControllerable where Self: LoginViewController {
    func setup() {
//        self.tableView.backgroundView = addBackgroundImage(named: "backgroundImage")
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    private func addBackgroundImage(named image: String) -> UIView {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        backgroundImageView.image = UIImage(named: image)
        backgroundImageView.contentMode = .scaleAspectFill
        return backgroundImageView
    }
}
