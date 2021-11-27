//
//  BasePageControl.swift
//  Karrot
//
//  Created by User on 2021/07/26.
//

import UIKit

class BasePageControl: UIPageControl {

    // MARK: - Life Cycle
    init(pages:Int) {
        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
