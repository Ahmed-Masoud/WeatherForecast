//
//  Mocks.swift
//  WeatherForecastTests
//
//  Created by Fatema El Zahraa on 11/13/20.
//

import Foundation
@testable import WeatherForecast

class TestMocks {
    
    static let networkError = NSError(domain: "", code: 400, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericErrorMessage])
    
    static let weatherDetails = WeatherDetailsModel(weatherHighlight: "Clouds", weatherDescription: "scattered clouds", icon: "03d")
    
    static let weatherModelMock = WeatherModel(time: 1605184260, sunrise: 1605155108, sunset: 1605193423, temp: 296.15, feelsLike: 294.81, pressure: 1019, humidity: 56, windSpeed: 3.6, details: [weatherDetails], uvi: 4.4, visibility: 10000)

    static let tempModelMock = TemperatureModel(day: 295.87, min: 292.35, max: 296.15, night: 294.76, eve: 295.89, morn: 292.35)
    
    static let feelsLikeModelMock = TemperatureModel(day: 295.87, min: 292.35, max: 296.15, night: 294.76, eve: 295.89, morn: 292.35)
    
    static let dailyWeatherModelMock = DailyWeatherModel(time: 1605184260, sunrise: 1605155108, sunset: 1605193423, temp: tempModelMock, feelsLike: feelsLikeModelMock, pressure: 1019, humidity: 56, windSpeed: 3.6, details: [weatherDetails], uvi: 4.4)
    
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
