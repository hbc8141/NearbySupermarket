//
//  LocationPermissionErrorView.swift
//  Supermarket
//
//  Created by User on 2021/07/02.
//

import UIKit

class LocationPermissionErrorView: UIView {
    
    // MARK: - Properties
    private let titleLable:BaseLabel = BaseLabel(title: "위치 에러")
    
    // MARK: - Life Cycle
    init() {
        super.init(frame: .zero)
        
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
}
