//
//  AppDelegate.swift
//  SpotifyScreenLayout
//
//  Created by Олег Федоров on 02.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(
            rootViewController: SpotifyViewController()
        )
        window?.rootViewController = navigationController
        
        return true
    }
}

