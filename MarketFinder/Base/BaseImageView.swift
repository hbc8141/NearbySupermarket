//
//  BaseImageView.swift
//  Supermarket
//
//  Created by User on 2021/07/05.
//

import UIKit

enum Images: String {
    case image
    
    var image:UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}

class BaseImageView: UIImageView {
    
    // MARK: - Life Cycle
    init(images:Images? = nil, contentMode: UIView.ContentMode = .scaleToFill) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode
        
        // 이미지명이 존재할 경우 이미지 대입
        if let image:UIImage = images?.image {
            self.image = image
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
}
