//
//  DailyWeatherModel.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

class DailyWeatherModel: BaseWeatherModel {
    
    var temp: TemperatureModel?
    var feelsLike: TemperatureModel?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
    
    init(time: Int?, sunrise: Int?, sunset: Int?, temp: TemperatureModel?, feelsLike: TemperatureModel?, pressure: Int?, humidity: Int?, windSpeed: Double?, details: [WeatherDetailsModel]?, uvi: Double?) {
        super.init(time: time, sunrise: sunrise, sunset: sunset, pressure: pressure, humidity: humidity, windSpeed: windSpeed, details: details, uvi: uvi)
        self.temp = temp
        self.feelsLike = feelsLike
    }
    // Must type the encoder/decoder manually because of Inheritance
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        temp = try container.decodeIfPresent(TemperatureModel.self, forKey: .temp)
        feelsLike = try container.decodeIfPresent(TemperatureModel.self, forKey: .feelsLike)
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(temp, forKey: .temp)
        try container.encode(feelsLike, forKey: .feelsLike)
    }
    
}
