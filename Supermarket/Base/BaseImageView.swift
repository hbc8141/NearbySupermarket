//
//  BaseImageView.swift
//  Supermarket
//
//  Created by User on 2021/07/05.
//

import UIKit

class BaseImageView: UIImageView {
    
    // MARK: - Life Cycle
    init(image:UIImage? = nil, contentMode: UIView.ContentMode = .scaleToFill) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = contentMode
        self.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
}
