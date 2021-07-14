//
//  AppDelegate.swift
//  Supermarket
//
//  Created by User on 2020/06/27.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 네트워크 변경 감지
        NetworkMonitor.shared.startMonitoring()

        let mapController:MapController = MapController()
        
        let window:UIWindow = UIWindow()
        window.rootViewController = CustomNavController(rootViewController: mapController)
        self.window = window
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

