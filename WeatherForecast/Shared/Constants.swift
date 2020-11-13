//
//  Constants.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation


struct App {
    #if PROD
    static let isProduction = true
    #else
    static let isProduction = false
    #endif
    // should have diffrent keys
    static let WEATHER_API_KEY = App.isProduction ? "4148e5153d6d6a0444a554646c392a8a" : "4148e5153d6d6a0444a554646c392a8a"
}

struct StoryBoard {
    static let main = "Main"
}

struct Server {
    // should have diffrent urls
    static let serverBaseURL = App.isProduction ? "https://api.openweathermap.org/data/2.5" : "https://api.openweathermap.org/data/2.5"
    static let imagesBaseURL = App.isProduction ? "https://openweathermap.org/img/w/" : "https://openweathermap.org/img/w/"
}

struct ErrorMessage {
    static let genericErrorMessage = "Couldn't submit your request. Please try again later."
}

struct Endpoint {
    static let getForecast = "/onecall"
}
