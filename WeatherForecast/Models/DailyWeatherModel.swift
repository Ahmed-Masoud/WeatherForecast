//
//  DailyWeatherModel.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

class DailyWeatherModel: Codable {
    var time: Int?
    var sunrise: Int?
    var sunset: Int?
    var temp: TemperatureModel?
    var feelsLike: TemperatureModel?
    var pressure: Int?
    var humidity: Int?
    var windSpeed: Double?
    var details: [WeatherDetailsModel]?
    var uvi: Double?
    
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, uvi, temp
        case time = "dt"
        case feelsLike = "feels_like"
        case pressure, humidity
        case windSpeed = "wind_speed"
        case details = "weather"
    }
    
    init(time: Int?, sunrise: Int?, sunset: Int?, temp: TemperatureModel?, feelsLike: TemperatureModel?, pressure: Int?, humidity: Int?, windSpeed: Double?, details: [WeatherDetailsModel]?, uvi: Double?) {
        self.time = time
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.details = details
        self.uvi = uvi
    }
}
