//
//  BaseButton.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit
import FontAwesome_swift

class BaseButton: UIButton {

    // MARK: - Initialization
    init(title: String? = nil) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
    }
    
    init(fontIcon: FontAwesome, style:FontAwesomeStyle, fontSize: CGFloat = 15) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.font = UIFont.fontAwesome(ofSize: fontSize, style: style)
        self.setTitle(String.fontAwesomeIcon(name: fontIcon), for: .normal)
        self.setTitleColor(.black, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
