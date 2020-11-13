//
//  WeatherOverViewTests.swift
//  WeatherForecastTests
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import XCTest
@testable import WeatherForecast

class WeatherOverViewTests: XCTestCase {
    
    fileprivate var viewModel: WeatherOverviewViewModelProtocol!
    fileprivate var provider: WeatherProviderMock!
    fileprivate var didFetchSuccessfully: Bool!
    fileprivate var error: String?
    
    override func setUpWithError() throws {
        viewModel = WeatherOverviewViewModel()
        provider = WeatherProviderMock()
        viewModel.setDependencies(provider: provider)
        viewModel.didFetchData = didFetchHandler
        viewModel.didFail = didFailHandler
    }
    
    func didFetchHandler() {
        didFetchSuccessfully = true
        self.error = nil
    }
    
    func didFailHandler(_ error: String) {
        didFetchSuccessfully = false
        self.error = error
    }
    
    func testLoadData() {
        provider.shouldMimickError = true
        viewModel.loadDate(lat: 31.22, lng: 29.96)
        XCTAssertFalse(didFetchSuccessfully)
        XCTAssertEqual(error, ErrorMessage.genericErrorMessage)
        
        provider.shouldMimickError = false
        viewModel.loadDate(lat: 31.22, lng: 29.96)
        XCTAssertTrue(didFetchSuccessfully)
        XCTAssertNil(error)
    }

}
