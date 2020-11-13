//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

class BaseWeatherModel: Codable {
    var time: Int?
    var sunrise: Int?
    var sunset: Int?
    var pressure: Int?
    var humidity: Int?
    var uvi: Double?
    var windSpeed: Double?
    var details: [WeatherDetailsModel]?
    
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset, pressure, humidity, uvi
        case time = "dt"
        case windSpeed = "wind_speed"
        case details = "weather"
    }
    
    init(time: Int?, sunrise: Int?, sunset: Int?, pressure: Int?, humidity: Int?, windSpeed: Double?, details: [WeatherDetailsModel]?, uvi: Double?) {
        self.time = time
        self.sunrise = sunrise
        self.sunset = sunset
        self.pressure = pressure
        self.humidity = humidity
        self.windSpeed = windSpeed
        self.details = details
        self.uvi = uvi
    }
}


class WeatherModel: BaseWeatherModel {
    
    var temp: Double?
    var feelsLike: Double?
    var visibility: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case temp, visibility
        case feelsLike = "feels_like"
    }
    
    init(time: Int?, sunrise: Int?, sunset: Int?, temp: Double?, feelsLike: Double?, pressure: Int?, humidity: Int?, windSpeed: Double?, details: [WeatherDetailsModel]?, uvi: Double?, visibility: Int?) {
        super.init(time: time, sunrise: sunrise, sunset: sunset, pressure: pressure, humidity: humidity, windSpeed: windSpeed, details: details, uvi: uvi)
        self.temp = temp
        self.feelsLike = feelsLike
        self.visibility = visibility
    }
    
    // Must type the encoder/decoder manually because of Inheritance
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        temp = try container.decodeIfPresent(Double.self, forKey: .temp)
        feelsLike = try container.decodeIfPresent(Double.self, forKey: .feelsLike)
        visibility = try container.decodeIfPresent(Int.self, forKey: .visibility)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(temp, forKey: .temp)
        try container.encode(feelsLike, forKey: .feelsLike)
        try container.encode(visibility, forKey: .visibility)
    }
    
    
}
