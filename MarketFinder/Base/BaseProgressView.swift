//
//  BaseProgressView.swift
//  Karrot
//
//  Created by User on 2021/07/27.
//

import UIKit

class BaseProgressView: UIProgressView {

    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
