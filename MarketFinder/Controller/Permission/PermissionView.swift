//
//  PermissionView.swift
//  MarketFinder
//
//  Created by User on 2021/10/18.
//

import UIKit

class PermissionView: BaseView {
    
    // MARK: - Properties
    private let iconImageView:BaseImageView = BaseImageView()
    
    private let titleLabel:BaseLabel = BaseLabel()
    
    var imageView:BaseImageView {
        get { return self.iconImageView }
    }
    
    var label:BaseLabel {
        get { return self.titleLabel }
    }
    
    // MARK: - Life Cycle
    init() {
        super.init()
        
        self.addSubviews(views: [
            self.iconImageView,
            self.titleLabel
        ])
        
        self.setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            self.iconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
            self.iconImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
            self.iconImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            self.iconImageView.bottomAnchor.constraint(equalTo: self.titleLabel.topAnchor, constant: -25),
            
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.iconImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
        ])
    }
}
