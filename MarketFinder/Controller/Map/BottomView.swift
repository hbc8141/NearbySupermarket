//
//  BottomView.swift
//  MarketFinder
//
//  Created by User on 2021/11/29.
//

import UIKit

class BottomView: BaseView {
    
    // MARK: - Properties
    private let barView:BaseView = {
        let barView:BaseView = BaseView(color: .gray)
        barView.layer.cornerRadius = 2
        
        return barView
    }()
    
    private let marketNameLabel:BaseLabel = BaseLabel(title: "코스트코 성수동점")
    
    private let marketAddressLabel:BaseLabel = BaseLabel(title: "부산광역시 수영구 남천1로 35")
    
    private let navigationButton:BaseButton = {
        let navigationButton:BaseButton = BaseButton(title: "길 안내")
        navigationButton.backgroundColor = .blue
        
        return navigationButton
    }()
    
    // MARK: - Life Cycle
    init() {
        super.init()
        
        self.layer.cornerRadius = 10
        
        self.addSubviews(views: [
            self.barView,
            self.marketNameLabel,
            self.marketAddressLabel,
            self.navigationButton
        ])
        
        self.setupLayouts()
        self.bindUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    override func bindUI() {
        self.navigationButton.rx.tap.asDriver()
            .drive(onNext: { _ in
                
            }).disposed(by: self.disposeBag)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            self.barView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.barView.widthAnchor.constraint(equalToConstant: 100),
            self.barView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.barView.heightAnchor.constraint(equalToConstant: 5),
            
            self.marketNameLabel.topAnchor.constraint(equalTo: self.barView.bottomAnchor, constant: 15),
            self.marketNameLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15),
            self.marketNameLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -15),
            self.marketNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            self.marketAddressLabel.topAnchor.constraint(equalTo: self.marketNameLabel.bottomAnchor, constant: 15),
            self.marketAddressLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15),
            self.marketAddressLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -15),
            self.marketAddressLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            self.navigationButton.topAnchor.constraint(equalTo: self.marketAddressLabel.bottomAnchor, constant: 15),
            self.navigationButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 15),
            self.navigationButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -15),
            self.navigationButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
