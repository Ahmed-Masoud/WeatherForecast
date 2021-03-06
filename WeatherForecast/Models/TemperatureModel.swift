//
//  TemperatureModel.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

class TemperatureModel: Codable {
    var day, min, max, night, eve, morn: Double?
    
    init(day: Double?, min: Double?, max: Double?, night: Double?, eve: Double?, morn: Double?) {
        self.day = day
        self.min = min
        self.max = max
        self.night = night
        self.eve = eve
        self.morn = morn
    }
}
