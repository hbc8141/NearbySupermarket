//
//  BaseView.swift
//  Karrot
//
//  Created by User on 2021/07/16.
//

import UIKit

class BaseView: UIView {

    // MARK: - Life Cycle
    init(color: UIColor? = .white) {
        super.init(frame: .zero)
     
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func setupLayouts() -> Void {}
    
    func bindUI() -> Void {}
}
