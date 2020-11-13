//
//  WeatherNetworking.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
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
        case .getForecast:
            return Endpoint.getForecast
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
        case let .getForecast(lat, lon):
            let params: [String: Any] = [
                "lat": lat,
                "lon": lon,
                "appid": App.WEATHER_API_KEY
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
}
