//
//  WeatherResponse.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

class WeatherResponse: Codable {
    let latitude: Float
    let longitude: Float
    let timezone: String
    let currently: CurrentWeather
    let hourly: HourlyWeather
    let daily: DailyWeather
    let offset: Float
}
