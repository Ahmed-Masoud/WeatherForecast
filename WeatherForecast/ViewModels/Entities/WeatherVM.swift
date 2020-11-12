//
//  WeatherVM.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

protocol WeatherVMProtocol {
    var dayDate: String? { get }
    var sunrise: String? { get }
    var sunset: String? { get }
    var temp: String? { get }
    var feelsLike: String? { get }
    var pressure: String? { get }
    var humidity: String? { get }
    var windSpeed: String? { get }
    var details: WeatherDetailsVMProtocol? { get }
    var uvIndex: Double? { get }
    var visibility: String? { get }
}

class WeatherVM: WeatherVMProtocol {
    
    private var weather: WeatherModel?
    
    init(weather: WeatherModel) {
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
    
    var temp: String? {
        weather?.temp?.asTemp()
    }
    
    var feelsLike: String? {
        weather?.feelsLike?.asTemp()
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
    
    var visibility: String? {
        "\(Int(weather?.visibility ?? 0 / 1000)) km"
    }
}
