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
    var dewPoint: Double?
    var windSpeed: Double?
    var windDeg: Int?
    var details: [WeatherDetailsModel]?
    var clouds: Int?
    var uvi: Double?
    
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, clouds, uvi, temp
        case time = "dt"
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case details = "weather"
    }
    
    init(time: Int?, sunrise: Int?, sunset: Int?, temp: TemperatureModel?, feelsLike: TemperatureModel?, pressure: Int?, humidity: Int?, dewPoint: Double?, windSpeed: Double?, windDeg: Int?, details: [WeatherDetailsModel]?, clouds: Int?, uvi: Double?) {
        self.time = time
        self.sunrise = sunrise
        self.sunset = sunset
        self.temp = temp
        self.feelsLike = feelsLike
        self.pressure = pressure
        self.humidity = humidity
        self.dewPoint = dewPoint
        self.windSpeed = windSpeed
        self.windDeg = windDeg
        self.details = details
        self.clouds = clouds
        self.uvi = uvi
    }
}
