//
//  Mocks.swift
//  WeatherForecastTests
//
//  Created by Ahmed Masoud on 11/13/20.
//

import Foundation
@testable import WeatherForecast

class TestMocks {
    
    // Weather Constants
    static let time = 1605184260
    static let sunrise = 1605155108
    static let sunset = 1605193423
    static let temp = 296.15
    static let feelsLike = 294.81
    static let pressure = 1019
    static let humidity = 56
    static let windSpeed = 3.6
    static let uvi = 4.4
    static let visibility = 10000
    
    // Temp Constants
    static let day = 295.87
    static let min = 292.35
    static let max = 296.15
    static let night = 294.76
    static let eve = 295.89
    static let morn = 292.35
    
    
    static let networkError = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericErrorMessage])
    
    static let weatherDetails = WeatherDetailsModel(weatherHighlight: "Clouds", weatherDescription: "scattered clouds", icon: "03d")
    
    static let weatherModelMock = WeatherModel(time: time, sunrise: sunrise, sunset: sunset, temp: temp, feelsLike: feelsLike, pressure: pressure, humidity: humidity, windSpeed: windSpeed, details: [weatherDetails], uvi: uvi, visibility: visibility)

    static let tempModelMock = TemperatureModel(day: day, min: min, max: max, night: night, eve: eve, morn: morn)
    
    static let feelsLikeModelMock = TemperatureModel(day: day, min: min, max: max, night: night, eve: eve, morn: morn)
    
    static let dailyWeatherModelMock = DailyWeatherModel(time: time, sunrise: sunrise, sunset: sunset, temp: tempModelMock, feelsLike: feelsLikeModelMock, pressure: pressure, humidity: humidity, windSpeed: windSpeed, details: [weatherDetails], uvi: uvi)
    
    static let weatherForecastResponseMock = WeatherForecastResponse(lat: 31.22, lon: 29.96, timeZone: "", current: weatherModelMock, hourly: [weatherModelMock, weatherModelMock], daily: [dailyWeatherModelMock, dailyWeatherModelMock, dailyWeatherModelMock])
}

class WeatherProviderMock: WeatherProviderProtocol {
    
    var shouldMimickError: Bool = false
    
    func getForecast(lat: Double, lng: Double, completion: @escaping (Result<WeatherForecastResponse?, NSError>) -> Void) {
        if shouldMimickError {
            completion(.failure(TestMocks.networkError))
            return
        }
        completion(.success(TestMocks.weatherForecastResponseMock))
    }
}
