//
//  LocationManager.swift
//  Supermarket
//
//  Created by User on 2020/06/28.
//

import CoreLocation
import UIKit
import RxSwift
import RxCocoa

class LocationManager {
    
    // MARK: - Properties
    static let shared:LocationManager = LocationManager()
    
    let location:BehaviorRelay<CLLocation?> = BehaviorRelay<CLLocation?>(value: CLLocation())

    private let locationMananger:CLLocationManager = {
        let manager:CLLocationManager = CLLocationManager()
        manager.activityType = .automotiveNavigation
        manager.distanceFilter = 50
        manager.pausesLocationUpdatesAutomatically = false
        manager.allowsBackgroundLocationUpdates = true

        return manager
    }()
    
    // MARK: - Life Cycle
    init() { }
    
    // MARK: - Function
    func currentLocation() -> Void {
        self.location.accept(locationMananger.location)
    }
    
    func requestPermission() -> Void {
        switch self.authorizationStatus() {
            case .authorizedAlways, .authorizedWhenInUse:
                return
            case .notDetermined:
                self.locationMananger.requestAlwaysAuthorization()
                return
            default:
                guard let settingsUrl:URL = URL(string: UIApplication.openSettingsURLString) else { return }
                
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
                }
                return
        }
    }
    
    func authorizationStatus() -> CLAuthorizationStatus {
        if #available(iOS 14, *) {
            return self.locationMananger.authorizationStatus
        } else {
            return CLLocationManager.authorizationStatus()
        }
    }
    
    func startLocation() -> Void {
        self.locationMananger.startUpdatingLocation()
        self.locationMananger.startMonitoringSignificantLocationChanges()
        self.locationMananger.pausesLocationUpdatesAutomatically = false
        self.locationMananger.allowsBackgroundLocationUpdates = true
    }
    
    func stopLocation() -> Void {
        self.locationMananger.stopUpdatingLocation()
        self.locationMananger.stopMonitoringSignificantLocationChanges()
        self.locationMananger.pausesLocationUpdatesAutomatically = true
        self.locationMananger.allowsBackgroundLocationUpdates = false
    }
}
