//
//  WeatherProvider.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation
protocol WeatherProviderProtocol: class {
    func getForecast(lat: Double, lng: Double, completion: @escaping (Result<WeatherForecastResponse?, NSError>) -> Void)
}

class WeatherProvider: BaseAPI<WeatherNetworking>, WeatherProviderProtocol {
    func getForecast(lat: Double, lng: Double, completion: @escaping (Result<WeatherForecastResponse?, NSError>) -> Void) {
        self.fetchData(target: .getForecast(lat: lat, lng: lng), responseClass: WeatherForecastResponse.self, completion: completion)
    }
}
