//
//  Date+Day.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self).capitalized
    }
    
    func timeOfDay() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self)
    }
}
