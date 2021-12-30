//
//  PermissionController.swift
//  MarketFinder
//
//  Created by User on 2021/10/15.
//

import Foundation
import RxSwift
import RxCocoa
import FontAwesome_swift

class PermissionController: BaseController {
    
    // MARK: - Properties
    private let permissionView:PermissionView = PermissionView()
    
    let requestPermissionButton:BaseButton = BaseButton()
    
    private let viewModel:PermissionViewModel = PermissionViewModel()
    
    // MARK: - Life Cycle
//    init(type:Permission) {
//        super.init(nibName: nil, bundle: nil)
//
//        self.viewModel.permissionType.accept(type)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubviews(views: [
            self.permissionView,
            self.requestPermissionButton
        ])
        
        self.setupLayouts()
        self.bind()
    }
    
    // MARK: - Function
    // 알림 요청
    private func bind() -> Void {
        // 권한 요청에 따른 아이콘, 제목, 버튼 변경
        self.viewModel.iconImage.bind(to: self.permissionView.imageView.rx.image).disposed(by: self.disposeBag)

        self.viewModel.titleLabel.bind(to: self.permissionView.label.rx.text).disposed(by: self.disposeBag)

        self.viewModel.buttonLabel.bind(to: self.requestPermissionButton.rx.title()).disposed(by: self.disposeBag)
    }
    
    override func bindUI() {
        // 권한 요청 클릭
//        self.requestPermissionButton.rx.tap
//            .asDriver()
//            .drive(onNext: {
//                self.manager.requestWhenInUseAuthorization()
//            }).disposed(by: self.disposeBag)

//        self.manager.rx.didChangeAuthorization
//            .flatMapLatest { (event:CLAuthorizationEvent) -> Observable<CLAuthorizationStatus> in
//                return .just(event.status)
//            }
//            .subscribe(onNext: { (status:CLAuthorizationStatus) in
//                print("status : \(status)")
//            }).disposed(by: self.disposeBag)
    }
    
    override func setupLayouts() {
        NSLayoutConstraint.activate([
            self.permissionView.widthAnchor.constraint(equalToConstant: 350),
            self.permissionView.heightAnchor.constraint(equalToConstant: 350),
            self.permissionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.permissionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.requestPermissionButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            self.requestPermissionButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 25),
            self.requestPermissionButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -25),
            self.requestPermissionButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}
