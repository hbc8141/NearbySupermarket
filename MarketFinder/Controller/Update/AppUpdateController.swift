//
//  AppUpdateController.swift
//  MarketFinder
//
//  Created by User on 2021/10/20.
//

import UIKit

class AppUpdateController: BaseController {
    
    // MARK: - Properties
    private let contentLabel:BaseLabel = BaseLabel()
    
    private let optionalUpdateButton:BaseButton = BaseButton(title: "OptionalUpdateButton")
    
    private let requiredUpdateButton:BaseButton = BaseButton(title: "RequiredUpdateButton")
    
    private let viewModel:AppUpdateViewModel = AppUpdateViewModel()
    
    // MARK: - Life Cycle
    init(updated: AppUpdate) {
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.appUpdated.accept(updated)
        
        self.view.addSubviews(views: [
            self.contentLabel,
            self.optionalUpdateButton,
            self.requiredUpdateButton
        ])
        
        self.setupLayouts()
        self.bindUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    override func bindUI() {
        // 앱 업데이트 여부에 따른 제목 설정
        self.viewModel.titleLabel.bind(to: self.contentLabel.rx.text).disposed(by: self.disposeBag)
        
        // 앱 업데이트 여부에 따른 다음에 업데이트하기 버튼 숨김 처리
        self.viewModel.appUpdated.map { $0 == .optional ? false : true }
            .bind(to: self.optionalUpdateButton.rx.isHidden)
            .disposed(by: self.disposeBag)

        // 앱 선택 업데이트 클릭 시
        self.optionalUpdateButton.rx.tap
            .bind(onNext: {
                self.moveToAppStore()
            }).disposed(by: self.disposeBag)
        
        // 앱 강제 업데이트 클릭 시
        self.requiredUpdateButton.rx.tap
            .bind(onNext: {
                self.moveToAppStore()
            }).disposed(by: self.disposeBag)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            self.contentLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.contentLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.contentLabel.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.contentLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0),
            
            self.optionalUpdateButton.bottomAnchor.constraint(equalTo: self.requiredUpdateButton.safeAreaLayoutGuide.topAnchor, constant: -25),
            self.optionalUpdateButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.optionalUpdateButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.optionalUpdateButton.heightAnchor.constraint(equalToConstant: 44),
            
            self.requiredUpdateButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            self.requiredUpdateButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.requiredUpdateButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.requiredUpdateButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    private func moveToAppStore() -> Void {
        guard let url:URL = URL(string: "") else { return }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func moveToMapController() -> Void {
        UNUserNotificationCenter.current().getNotificationSettings { (setting:UNNotificationSettings) in
            var controller:UIViewController = UIViewController()
            
//            if setting.authorizationStatus != .authorized {
//                controller = 
//            } else {
//                
//            }
        }
    }
}
