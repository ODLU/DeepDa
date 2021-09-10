//
//  UIView+.swift
//  DeepDa
//
//  Created by WANKI KIM on 2021/09/10.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
}
