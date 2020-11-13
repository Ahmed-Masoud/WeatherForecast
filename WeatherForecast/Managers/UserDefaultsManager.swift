//
//  UserDefaultsManager.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

enum DegreeType: String {
    case centigrade = "centigrade"
    case fahrenheit = "fahrenheit"
}

class UserDefaultsManager {
    
    //MARK: Singleton
    static let shared = UserDefaultsManager()
    
    private struct UserDefaultsKeys {
        static let degreeType = "UDKDegreeType"
        static let currentWeather = "UDKCurrentWeather"
        static let hourlyWeather = "UDKHourlyWeather"
        static let dailyWeather = "UDKDailyWeather"
    }
    
    //MARK: Properties
    var degreeType: DegreeType {
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKeys.degreeType)
        }
        get {
            let rawType = UserDefaults.standard.string(forKey: UserDefaultsKeys.degreeType)
            guard let safeRawType = rawType, let safeDegreeType = DegreeType(rawValue: safeRawType) else {
                // Defaults to Fahrenheit
                return .fahrenheit
            }
            return safeDegreeType
        }
    }
    
    var currentWeather: WeatherModel? {
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: UserDefaultsKeys.currentWeather)
            }
        }
        get {
            guard let savedCurrentWeather = UserDefaults.standard.object(forKey: UserDefaultsKeys.currentWeather) as? Data else { return nil }
            let decoder = JSONDecoder()
            return try? decoder.decode(WeatherModel.self, from: savedCurrentWeather)
        }
    }
    
    var hourlyWeather: [WeatherModel]? {
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: UserDefaultsKeys.hourlyWeather)
            }
        }
        get {
            guard let savedHourlyWeather = UserDefaults.standard.object(forKey: UserDefaultsKeys.hourlyWeather) as? Data else { return nil }
            let decoder = JSONDecoder()
            return try? decoder.decode([WeatherModel].self, from: savedHourlyWeather)
        }
    }
    
    var dailyWeather: [DailyWeatherModel]? {
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: UserDefaultsKeys.dailyWeather)
            }
        }
        get {
            guard let savedDailyWeather = UserDefaults.standard.object(forKey: UserDefaultsKeys.dailyWeather) as? Data else { return nil }
            let decoder = JSONDecoder()
            return try? decoder.decode([DailyWeatherModel].self, from: savedDailyWeather)
        }
    }
    
}

