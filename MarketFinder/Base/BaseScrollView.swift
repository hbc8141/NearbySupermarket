//
//  BaseScrollView.swift
//  Flapic
//
//  Created by User on 2021/09/30.
//

import UIKit

class BaseScrollView: UIScrollView {

    // MARK: - Properties
    init() {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentSize = UIScreen.main.bounds.size
        self.contentSize.height = self.contentSize.height - 45
        self.isScrollEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
