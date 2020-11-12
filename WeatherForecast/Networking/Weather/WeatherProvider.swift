//
//  WeatherProvider.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation
protocol WeatherProviderProtocol: class {
    func getForecast(lat: Double, lng: Double, completion: @escaping (Result<WeatherResponse?, NSError>) -> Void)
}

class WeatherProvider: BaseAPI<WeatherNetworking>, WeatherProviderProtocol {
    func getForecast(lat: Double, lng: Double, completion: @escaping (Result<WeatherResponse?, NSError>) -> Void) {
        self.fetchData(target: .getForecast(lat: lat, lng: lng), responseClass: WeatherResponse.self, completion: completion)
    }
}
