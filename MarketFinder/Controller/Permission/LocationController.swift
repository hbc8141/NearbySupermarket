//
//  LocationController.swift
//  MarketFinder
//
//  Created by User on 2021/12/28.
//

import UIKit
import RxSwift
import CoreLocation

class LocationController: PermissionController {
    
    // MARK: - Properties
    private let manager:CLLocationManager = CLLocationManager()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bindUI()
    }
    
    // MARK: - Function
    override func bindUI() {
        self.requestPermissionButton.rx.tap
            .asDriver()
            .drive(onNext: { () in
                self.manager.requestWhenInUseAuthorization()
            }).disposed(by: self.disposeBag)
    }
}
