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
        UserDefaultsManager.shared.degreeType = .centigrade
        let HomeVC = WeatherOverviewVC.create(viewModel: WeatherOverviewViewModel())
        window?.rootViewController = HomeVC
        window?.makeKeyAndVisible()
        return true
    }


}

