//
//  WeatherNetworking.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation
import Alamofire

enum WeatherNetworking {
    case getForecast(lat: Double, lng: Double)
}

extension WeatherNetworking: TargetType {
    var baseURL: String {
        return Server.serverBaseURL
    }
    
    var path: String {
        switch self {
        case let .getForecast(lat, lng):
            return String(format: Endpoint.getForecast, App.WEATHER_API_KEY, "\(lat)", "\(lng)")
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getForecast:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getForecast:
            return .requestParameters(parameters: ["exclude" : "[flags,minutely]"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
}
