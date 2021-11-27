//
//  BaseTextField.swift
//  Karrot
//
//  Created by User on 2021/07/22.
//

import UIKit

class BaseTextField: UITextField {

    // MARK: - Life Cycle
    // 글자표시 공간 재설정
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return self.resizeTextRect(bounds: bounds)
    }
    
    // 글자입력 시 공간 재설정
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.resizeTextRect(bounds: bounds)
    }
    
    init(text: String? = nil, placeholder: String? = nil, keyboardType:UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.placeholder = placeholder?.localized
        self.text = text?.localized
        self.textColor = UIColor.blackTextColor
        self.keyboardType = keyboardType
        self.layer.borderColor = UIColor.accentColor.cgColor
        self.layer.cornerRadius = 5
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.accentColor.cgColor
        self.layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    // 글자 입력 및 표시 공간 재설정 함수
    private func resizeTextRect(bounds: CGRect) -> CGRect {
        let padding:CGFloat = 10
        let width:CGFloat = bounds.width - padding * 2

        let resizeRect:CGRect = CGRect(x: padding, y: 0, width: width, height: bounds.height)
        
        return resizeRect
    }
}
