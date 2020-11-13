//
//  WeatherForecastResponse.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

class WeatherForecastResponse: Codable {
    let lat: Float?
    let lon: Float?
    let timezone: String?
    let current: WeatherModel?
    let hourly: [WeatherModel]?
    let daily: [DailyWeatherModel]?
    
    init(lat: Float, lon: Float, timeZone: String, current: WeatherModel, hourly: [WeatherModel], daily: [DailyWeatherModel]) {
        self.lat = lat
        self.lon = lon
        self.timezone = timeZone
        self.current = current
        self.hourly = hourly
        self.daily = daily
    }
}
