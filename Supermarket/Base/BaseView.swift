//
//  BaseView.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit

class BaseView: UIView {

    // MARK: - Initialization
    init(color: UIColor? = .white) {
        super.init(frame: .zero)
     
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayouts() -> Void {}
}
