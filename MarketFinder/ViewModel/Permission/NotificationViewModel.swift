//
//  NotificationViewModel.swift
//  MarketFinder
//
//  Created by User on 2021/12/30.
//

import UIKit
import RxSwift
import RxCocoa

class NotificationViewModel: PermissionViewModel {
    
    // MARK: - Properties
    let notificationAuthObserver:Observable<UNAuthorizationStatus> = Observable.create { (observer) -> Disposable in
        UNUserNotificationCenter.current().getNotificationSettings { (settings:UNNotificationSettings) in
            observer.onNext(settings.authorizationStatus)
            observer.onCompleted()
        }
        
        return Disposables.create()
    }
    
    let requestNotificationObserver:Observable<Bool> = Observable.create { (observer) -> Disposable in
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted:Bool, error:Error?) in
            if let error:Error = error {
                observer.onError(error)
            } else {
                observer.onNext(granted)
                observer.onCompleted()
            }
        }
        
        return Disposables.create()
    }
    
    // MARK: - Life Cycle
    override init() {
        super.init()
        
        self.permissionType.accept(.notification)
    }
    
    // MARK: - Function
}
