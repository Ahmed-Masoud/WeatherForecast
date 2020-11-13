//
//  Utilities.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation
import UserNotifications
import NotificationCenter

class Utilities {
    class func setUpLocalNotification(hour: Int, minute: Int) {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Notifications Granted")
            } else {
                print("Notification not granted")
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Weather Forcast"
        content.body = "Check today's weather before going out"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
}
