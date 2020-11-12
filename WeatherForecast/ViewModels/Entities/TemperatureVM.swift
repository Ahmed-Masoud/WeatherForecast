//
//  TemperatureVM.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

protocol TemperatureVMProtocol {
    var day: String? { get }
    var min: String? { get }
    var max: String? { get }
    var night: String? { get }
    var eve: String? { get }
    var morn: String? { get }
    var avg: String? { get }
}

class TemperatureVM: TemperatureVMProtocol {
    
    private var temperature: TemperatureModel?
    
    init(temperature: TemperatureModel?) {
        self.temperature = temperature
    }
    
    var day: String? {
        return temperature?.day?.asTemp()
    }
    
    var min: String? {
        temperature?.min?.asTemp()
    }
    
    var max: String? {
        temperature?.max?.asTemp()
    }
    
    var night: String? {
        temperature?.night?.asTemp()
    }
    
    var eve: String? {
        temperature?.eve?.asTemp()
    }
    
    var morn: String? {
        temperature?.morn?.asTemp()
    }
    
    var avg: String? {
        let evening = temperature?.eve ?? 0
        let morning = temperature?.morn ?? 0
        let average = (evening + morning) / 2
        return average.asTemp()
    }
    
}
