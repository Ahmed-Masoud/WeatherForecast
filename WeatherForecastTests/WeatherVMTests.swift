//
//  WeatherVMTests.swift
//  WeatherForecastTests
//
//  Created by Ahmed Masoud on 11/13/20.
//

import Foundation
import XCTest
@testable import WeatherForecast

class WeatherVMTests: XCTestCase {
    //MARK:- Properties
    fileprivate var weatherVM: WeatherVMProtocol!
    
    override func setUp() {
        weatherVM = WeatherVM(weather: TestMocks.weatherModelMock)
    }
    
    func testProperties() {
        // Day Date
        var date = Date(timeIntervalSince1970: Double(TestMocks.weatherModelMock.time ?? 0))
        XCTAssertEqual(weatherVM.dayDate, date.dayOfWeek())
        // Time Of Day
        date = Date(timeIntervalSince1970: Double(TestMocks.weatherModelMock.time ?? 0))
        XCTAssertEqual(weatherVM.timeOfDay, date.timeOfDay())
        //Sunrise
        date = Date(timeIntervalSince1970: Double(TestMocks.weatherModelMock.sunrise ?? 0))
        XCTAssertEqual(weatherVM.sunrise, date.timeOfDay())
        //Sunset
        date = Date(timeIntervalSince1970: Double(TestMocks.weatherModelMock.sunset ?? 0))
        XCTAssertEqual(weatherVM.sunset, date.timeOfDay())
        // Temp
        XCTAssertEqual(weatherVM.temp, TestMocks.weatherModelMock.temp?.asTemp())
        // Feels Like
        XCTAssertEqual(weatherVM.feelsLike, TestMocks.weatherModelMock.feelsLike?.asTemp())
        // Pressure
        XCTAssertEqual(weatherVM.pressure, "\(TestMocks.weatherModelMock.pressure!) hPa")
        // Humidity
        XCTAssertEqual(weatherVM.humidity, "\(TestMocks.weatherModelMock.humidity!) %")
        // Wind Speed
        XCTAssertEqual(weatherVM.windSpeed, "\(Int(TestMocks.weatherModelMock.windSpeed ?? 0)) Km/hr")
        // UV Index
        XCTAssertEqual(weatherVM.uvIndex, String(TestMocks.weatherModelMock.uvi ?? 0))
        // Visibility
        XCTAssertEqual(weatherVM.visibility, "\(Int((TestMocks.weatherModelMock.visibility ?? 0) / 1000)) km")
    }
}
