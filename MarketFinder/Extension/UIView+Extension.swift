//
//  UIView+Extension.swift
//  MarketFinder
//
//  Created by User on 2021/10/18.
//

import UIKit

extension UIView {
    
    // MARK: - Function
    // 여러 개의 뷰 추가
    func addSubviews(views: [UIView]) -> Void {
        for view in views {
            self.addSubview(view)
        }
    }
}
