//
//  AppUpdateViewModel.swift
//  MarketFinder
//
//  Created by User on 2021/10/20.
//

import RxSwift
import RxCocoa
import Foundation

class AppUpdateViewModel {
    
    // MARK: - Properties
    let appUpdated:BehaviorRelay<AppUpdate> = BehaviorRelay<AppUpdate>(value: .optional)
    
    let titleLabel:BehaviorRelay<String> = BehaviorRelay<String>(value: "")

    private let disposeBag:DisposeBag = DisposeBag()

    // MARK: - Life Cycle
    init() {
        self.appUpdated.map { $0.title }.bind(to: self.titleLabel)
            .disposed(by: self.disposeBag)
        
        
    }
}
