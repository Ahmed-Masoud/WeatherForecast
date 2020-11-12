//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation


class WeatherModel: Codable {
    var time: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: Double?
    var feelsLike: Double?
    var pressure: Int?
    var humidity: Int?
    var uvi: Double?
    var visibility: Int?
    var windSpeed: Double?
    var details: [WeatherDetailsModel]?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, temp, pressure, humidity, uvi, visibility
        case time = "dt"
        case feelsLike = "feels_like"
        case windSpeed = "wind_speed"
        case details = "weather"
    }
    
    
}
