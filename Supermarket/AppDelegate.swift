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
        
        let mapController:MapController = MapController()
        
        let window:UIWindow = UIWindow()
        window.rootViewController = CustomNavController(rootViewController: mapController)
        self.window = window
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

