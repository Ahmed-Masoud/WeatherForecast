//
//  WeatherOverviewViewModel.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import Foundation

protocol WeatherOverviewViewModelProtocol {
    var didFetchData: (()->())? { get set }
    var didFail: ((_ error: String)->())? { get set }
    var currentWeather: WeatherVMProtocol? { get }
    var hourlyWeather: [WeatherVMProtocol]? { get }
    var dailyWeather: [DailyWeatherVMProtocol]? { get }
    func setDependencies(provider: WeatherProviderProtocol)
    func loadDate(lat: Double, lng: Double)
}

class WeatherOverviewViewModel {
    
    //MARK:- Properties
    var didFetchData: (() -> ())?
    var didFail: ((String) -> ())?
    var currentWeather: WeatherVMProtocol?
    var hourlyWeather: [WeatherVMProtocol]?
    var dailyWeather: [DailyWeatherVMProtocol]?
    private var provider: WeatherProviderProtocol?
}

extension WeatherOverviewViewModel: WeatherOverviewViewModelProtocol {
    
    func setDependencies(provider: WeatherProviderProtocol) {
        self.provider = provider
        self.currentWeather = WeatherVM(weather: UserDefaultsManager.shared.currentWeather)
        self.hourlyWeather = UserDefaultsManager.shared.hourlyWeather?.map({WeatherVM(weather: $0)})
        self.dailyWeather = UserDefaultsManager.shared.dailyWeather?.map({DailyWeatherVM(weather: $0)})
    }
    
    func loadDate(lat: Double, lng: Double) {
        provider?.getForecast(lat: lat, lng: lng, completion: { [weak self] (result) in
            switch result {
            case .success(let weatherResponse):
                self?.currentWeather = WeatherVM(weather: weatherResponse?.current)
                self?.hourlyWeather = (weatherResponse?.hourly ?? []).map({WeatherVM(weather: $0)})
                var dailyWeather = weatherResponse?.daily
                dailyWeather?.removeFirst() // Remove Today from the list
                self?.dailyWeather = (dailyWeather ?? []).map({DailyWeatherVM(weather: $0)})
                self?.didFetchData?()
                UserDefaultsManager.shared.currentWeather = weatherResponse?.current
                UserDefaultsManager.shared.hourlyWeather = weatherResponse?.hourly
                UserDefaultsManager.shared.dailyWeather = dailyWeather
            case .failure(let error):
                print(error)
                self?.didFail?(ErrorMessage.genericErrorMessage)
            }
        })
    }
}
