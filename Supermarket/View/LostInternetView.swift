//
//  LostInternetView.swift
//  Supermarket
//
//  Created by User on 2021/07/05.
//

import UIKit

class LostInternetView: BaseView {
    
    // MARK: - Properties
    private let titleLabel:BaseLabel = BaseLabel(title: "인터넷 연결 오류")
    
    private let descriptionLabel:BaseLabel = BaseLabel(title: "인터넷 연결 확인해주세요")
    
    private let confirmButton:BaseButton = BaseButton(title: "확인", backgroundColor: .blue)
    
    // MARK: - Life Cycle
    init() {
        super.init(color: .white)

        self.addSubviews(views: [
            self.confirmButton, self.titleLabel, self.descriptionLabel
        ])

        self.setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            self.titleLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: 25),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -25),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant:25),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.confirmButton.topAnchor, constant: -10),

            self.confirmButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.confirmButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.confirmButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -25),
            self.confirmButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
