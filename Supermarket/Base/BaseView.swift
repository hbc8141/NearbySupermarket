//
//  BaseView.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit

class BaseView: UIView {

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
