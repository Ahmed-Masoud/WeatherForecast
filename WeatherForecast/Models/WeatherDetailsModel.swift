//
//  WeatherDetailsModel.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

class WeatherDetailsModel: Codable {
    var weatherHighlight: String?
    var weatherDescription: String?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case icon
        case weatherHighlight = "main"
        case weatherDescription = "description"
    }
    
    init(weatherHighlight: String?, weatherDescription: String?, icon: String?) {
        self.weatherHighlight = weatherHighlight
        self.weatherDescription = weatherDescription
        self.icon = icon
    }
}
