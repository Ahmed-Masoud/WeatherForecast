//
//  WeatherOverviewViewModel.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

protocol WeatherOverviewViewModelProtocol {
    var didFetchData: (()->())? { get set }
    var didFail: ((_ error: String)->())? { get set }
    func setDependencies(provider: WeatherProviderProtocol)
    func loadDate(lat: Double, lng: Double)
}

class WeatherOverviewViewModel {
    
    //MARK:- Properties
    var didFetchData: (() -> ())?
    var didFail: ((String) -> ())?
    private var provider: WeatherProviderProtocol?
}

extension WeatherOverviewViewModel: WeatherOverviewViewModelProtocol {
    
    func setDependencies(provider: WeatherProviderProtocol) {
        self.provider = provider
    }
    
    func loadDate(lat: Double, lng: Double) {
        provider?.getForecast(lat: lat, lng: lng, completion: { [weak self] (result) in
            switch result {
            case .success(let weatherResponse):
                print(weatherResponse)
                self?.didFetchData?()
            case .failure(let error):
                print(error)
                self?.didFail?(ErrorMessage.genericErrorMessage)
            }
        })
    }
}
