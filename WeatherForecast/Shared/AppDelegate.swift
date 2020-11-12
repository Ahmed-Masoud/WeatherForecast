//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let homeVC = WeatherOverviewVC.create(viewModel: WeatherOverviewViewModel())
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.makeTransparent()
        window?.rootViewController = homeNav
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

