//
//  TemperatureVMTests.swift
//  WeatherForecastTests
//
//  Created by Fatema El Zahraa on 11/13/20.
//

import XCTest
@testable import WeatherForecast

class TemperatureVMTests: XCTestCase {
    //MARK:- Properties
    fileprivate var temperatureVM: TemperatureVMProtocol!
    
    override func setUp() {
        temperatureVM = TemperatureVM(temperature: TestMocks.tempModelMock)
    }
    
    func testProperties() {
        // Day
        XCTAssertEqual(temperatureVM.day, TestMocks.tempModelMock.day?.asTemp())
        // min
        XCTAssertEqual(temperatureVM.min, TestMocks.tempModelMock.min?.asTemp())
        // max
        XCTAssertEqual(temperatureVM.max, TestMocks.tempModelMock.max?.asTemp())
        // night
        XCTAssertEqual(temperatureVM.night, TestMocks.tempModelMock.night?.asTemp())
        // eve
        XCTAssertEqual(temperatureVM.eve, TestMocks.tempModelMock.eve?.asTemp())
        // morn
        XCTAssertEqual(temperatureVM.morn, TestMocks.tempModelMock.morn?.asTemp())
        // min
        XCTAssertEqual(temperatureVM.avg, ((TestMocks.tempModelMock.night! + TestMocks.tempModelMock.morn!) / 2).asTemp())
    }
}
