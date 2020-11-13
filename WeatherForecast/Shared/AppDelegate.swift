//
//  AppDelegate.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import UIKit
import BackgroundTasks

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: App.BACKGROUND_TASK_ID,
                                        using: nil) { (task) in
            self.handleAppRefreshTask(task: task as! BGAppRefreshTask)
        }
        Utilities.setUpLocalNotification(hour: 10, minute: 30)
        let homeVC = WeatherOverviewVC.create(viewModel: WeatherOverviewViewModel())
        let homeNav = UINavigationController(rootViewController: homeVC)
        homeNav.makeTransparent()
        window?.rootViewController = homeNav
        window?.makeKeyAndVisible()
        return true
    }
    
    func handleAppRefreshTask(task: BGAppRefreshTask) {
        // to test this you need to run on a real device and pause program execution the type this command in console 'e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"com.fetchWeather"]' then resume the running
        NotificationCenter.default.post(name: .shouldUpdateWeather, object: self)
        task.setTaskCompleted(success: true)
        scheduleBackgroundWeatherFetch()
    }
    
    func scheduleBackgroundWeatherFetch() {
        let weatherFetchTask = BGAppRefreshTaskRequest(identifier: App.BACKGROUND_TASK_ID)
        weatherFetchTask.earliestBeginDate = Date(timeIntervalSinceNow: 60)
        do {
            try BGTaskScheduler.shared.submit(weatherFetchTask)
        } catch {
            print("Unable to submit task: \(error.localizedDescription)")
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        scheduleBackgroundWeatherFetch()
    }
    
    
}

