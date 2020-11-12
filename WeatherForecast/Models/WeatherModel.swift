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
    var dewPoint: Double?
    var uvi: Double?
    var clouds: Int?
    var visibility: Int?
    var windSpeed: Double?
    var windDeg: Int?
    var details: [WeatherDetailsModel]?

    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, temp, pressure, humidity, uvi, clouds, visibility
        case time = "dt"
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case details = "weather"
    }
    
    
}
