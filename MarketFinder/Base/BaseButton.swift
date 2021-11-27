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
    // 일반 버튼
    init(title: String? = nil, backgroundColor: UIColor? = UIColor.accentColor) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(UIColor.whiteTextColor, for: .normal)
        self.layer.cornerRadius = 5
        self.setTitle(title?.localized, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.accentColor.cgColor
    }
    
    // FontAwesome 아이콘 폰트
    init(idle:FontAwesome? = nil, selected:FontAwesome? = nil, style: FontAwesomeStyle = .regular) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.black, for: .selected)
        self.titleLabel?.font = UIFont.fontAwesome(ofSize: 25, style: style)
        
        if let idleIcon:FontAwesome = idle {
            self.setTitle(String.fontAwesomeIcon(name: idleIcon), for: .normal)
        }
        
        if let selectedIcon:FontAwesome = selected {
            self.setTitle(String.fontAwesomeIcon(name: selectedIcon), for: .selected)
        }
    }
    
    // 약관 전체버튼

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
