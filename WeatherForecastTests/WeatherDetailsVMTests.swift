//
//  WeatherDetailsVMTests.swift
//  WeatherForecastTests
//
//  Created by Ahmed Masoud on 11/13/20.
//

import Foundation
import XCTest
@testable import WeatherForecast

class WeatherDetailsVMTests: XCTestCase {
    //MARK:- Properties
    fileprivate var weatherDetailsVM: WeatherDetailsVMProtocol!
    
    override func setUp() {
        weatherDetailsVM = WeatherDetailsVM(weatherDetails: TestMocks.weatherDetails)
    }
    
    func testProperties() {
        // Weather Highlight
        XCTAssertEqual(weatherDetailsVM.weatherHighlight, TestMocks.weatherDetails.weatherHighlight)
        // Weather Description
        XCTAssertEqual(weatherDetailsVM.weatherDescription, TestMocks.weatherDetails.weatherDescription)
        // Icon
        XCTAssertEqual(weatherDetailsVM.icon, "\(Server.imagesBaseURL)/\(TestMocks.weatherDetails.icon!).png")
    }
}
