//
//  DailyWeatherVM.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

protocol DailyWeatherVMProtocol {
    var dayDate: String? { get }
    var sunrise: String? { get }
    var sunset: String? { get }
    var temp: TemperatureVMProtocol? { get }
    var feelsLike: TemperatureVMProtocol? { get }
    var pressure: String? { get }
    var humidity: String? { get }
    var windSpeed: String? { get }
    var details: WeatherDetailsVMProtocol? { get }
    var uvIndex: Double? { get }
}

class DailyWeatherVM: DailyWeatherVMProtocol {
    
    private var weather: DailyWeatherModel?
    
    init(weather: DailyWeatherModel) {
        self.weather = weather
    }
    
    var dayDate: String? {
        let date = Date(timeIntervalSince1970: Double(weather?.time ?? 0))
        return date.dayOfWeek()
    }
    
    var sunrise: String? {
        let date = Date(timeIntervalSince1970: Double(weather?.sunrise ?? 0))
        return date.timeOfDay()
    }
    
    var sunset: String? {
        let date = Date(timeIntervalSince1970: Double(weather?.sunset ?? 0))
        return date.timeOfDay()
    }
    
    var temp: TemperatureVMProtocol? {
        TemperatureVM(temperature: weather?.temp)
    }
    
    var feelsLike: TemperatureVMProtocol? {
        TemperatureVM(temperature: weather?.feelsLike)
    }
    
    var pressure: String? {
        "\(weather?.pressure ?? 0) hPa"
    }
    
    var humidity: String? {
        "\(weather?.humidity ?? 0) %"
    }
    
    var windSpeed: String? {
        "\(Int(weather?.windSpeed ?? 0)) Km/hr"
    }
    
    var details: WeatherDetailsVMProtocol? {
        WeatherDetailsVM(weatherDetails: weather?.details?.first)
    }
    
    var uvIndex: Double? {
        weather?.uvi
    }
}
