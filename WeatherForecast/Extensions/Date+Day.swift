//
//  Date+Day.swift
//  VitalCheckUp-IOS
//
//  Created by Ahmed masoud on 9/23/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
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
