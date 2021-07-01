//
//  UIView+extension.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit

extension UIView {
    func addSubviews(views:[UIView]) -> Void {
        for view in views {
            self.addSubview(view)
        }
    }
}
