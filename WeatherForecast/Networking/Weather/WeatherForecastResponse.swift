//
//  WeatherForecastResponse.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

class WeatherForecastResponse: Codable {
    let lat: Float
    let lon: Float
    let timezone: String
    let current: WeatherModel
    let hourly: [WeatherModel]
    let daily: [DailyWeatherModel]
    
}
