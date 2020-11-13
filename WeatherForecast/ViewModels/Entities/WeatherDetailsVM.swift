//
//  WeatherDetailsVM.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

protocol WeatherDetailsVMProtocol {
    var weatherHighlight: String? { get }
    var weatherDescription: String? { get }
    var icon: String? { get }
}

class WeatherDetailsVM: WeatherDetailsVMProtocol {
    
    private var weatherDetails: WeatherDetailsModel?
    
    init(weatherDetails: WeatherDetailsModel?) {
        self.weatherDetails = weatherDetails
    }
    
    var weatherHighlight: String? {
        weatherDetails?.weatherHighlight
    }
    
    var weatherDescription: String? {
        weatherDetails?.weatherDescription
    }
    
    var icon: String? {
        "\(Server.imagesBaseURL)/\(weatherDetails?.icon ?? "").png"
    }
    
}
