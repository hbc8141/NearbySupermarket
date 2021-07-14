//
//  BaseLabel.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit

class BaseLabel: UILabel {
    
    // MARK: - Life Cycles
    init(title:String? = nil, textColor:UIColor = .black) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = title
        self.textColor = textColor
        self.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
