//
//  Constants.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation


struct App {
    static let WEATHER_API_KEY = "4148e5153d6d6a0444a554646c392a8a"
}

struct StoryBoard {
    static let main = "Main"
}

struct Server {
    static let serverBaseURL = "https://api.openweathermap.org/data/2.5"
}

struct ErrorMessage {
    static let genericErrorMessage = "Couldn't submit your request. Please try again later."
}

struct Endpoint {
    static let getForecast = "/onecall"
}
