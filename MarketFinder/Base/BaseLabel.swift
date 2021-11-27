//
//  BaseLabel.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit

class BaseLabel: UILabel {
    
    // MARK: - Life Cycles
    init(title:String? = nil, textColor:UIColor? = nil, textAlignment:NSTextAlignment = .center) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = title?.localized
        self.textColor = textColor
        self.numberOfLines = 0
        self.textAlignment = textAlignment
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
