//
//  Constants.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation


struct App {
    static let WEATHER_API_KEY = "ddcc4ebb2a7c9930b90d9e59bda0ba7a"
}

struct StoryBoard {
    static let main = "Main"
}

struct Server {
    static let serverBaseURL = "https://api.darksky.net"
}

struct ErrorMessage {
    static let genericErrorMessage = "Couldn't submit your request. Please try again later."
}

struct Endpoint {
    static let getForecast = "/forecast/%@/%@,%@"
}
