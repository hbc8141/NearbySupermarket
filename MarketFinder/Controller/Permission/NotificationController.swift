//
//  NotificationController.swift
//  MarketFinder
//
//  Created by User on 2021/12/28.
//

import UIKit
import RxSwift
import RxCocoa

class NotificationController: PermissionController {
    
    // MARK: - Properties
    private let viewModel:NotificationViewModel = NotificationViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bindUI()
    }
    
    override func bindUI() {
        self.requestPermissionButton.rx.tap
            .debounce(.milliseconds(1000), scheduler: MainScheduler.instance)
            .flatMapLatest { self.viewModel.requestNotificationObserver }
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { (granted:Bool) in
                if granted {
                    self.pushViewController(MapController())
                } else {
                    
                }
            })
            .disposed(by: self.disposeBag)
    }
}
