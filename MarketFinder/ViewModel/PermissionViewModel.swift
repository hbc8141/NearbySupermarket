//
//  PermissionViewModel.swift
//  MarketFinder
//
//  Created by User on 2021/10/18.
//

import Foundation
import RxSwift
import RxCocoa
import CoreLocation

class PermissionViewModel {
    
    // MARK: - Properties
    let iconImage = BehaviorRelay<UIImage?>(value: nil)

    let titleLabel = BehaviorRelay<String>(value: "")
    
    let buttonLabel = BehaviorRelay<String>(value: "")

    let permissionType = BehaviorRelay<Permission>(value: .notification)

    let failedPermission = PublishRelay<Error>()
    
    let successPermission = PublishRelay<Void>()
    
    let disposeBag:DisposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    init() {
        self.permissionType.map { $0.icon }.bind(to: self.iconImage).disposed(by: self.disposeBag)

        self.permissionType.map { $0.title.localized }.bind(to: self.titleLabel).disposed(by: self.disposeBag)

        self.permissionType.map { $0.buttonTitle.localized }.bind(to: self.buttonLabel).disposed(by: self.disposeBag)
    }
}
