//
//  WeatherOverviewVC.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit
import CoreLocation

class WeatherOverviewVC: UIViewController {
    
    //MARK:- Outlets
    
    //MARK:- Properties
    private var viewModel: WeatherOverviewViewModelProtocol?
    private let locationManager = CLLocationManager()
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        LoadingSpinnerManager.shared.show()
    }

    //MARK:- Methods
    class func create(viewModel: WeatherOverviewViewModelProtocol) -> WeatherOverviewVC {
        let currentVC: WeatherOverviewVC = UIViewController.create(storyboardName: StoryBoard.main, identifier: "\(WeatherOverviewVC.self)")
        viewModel.setDependencies(provider: WeatherProvider())
        currentVC.viewModel = viewModel
        return currentVC
    }
    
    private func setupBinding() {
        viewModel?.didFetchData = didFetchData
        viewModel?.didFail = didFail
    }
    
    private func didFetchData() {
        LoadingSpinnerManager.shared.hide()
        print(viewModel?.currentWeather?.feelsLike)
    }
    
    private func didFail(_ error: String) {
        LoadingSpinnerManager.shared.hide()
        print(error)
    }
    
    private func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

}

extension WeatherOverviewVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty {
            guard let currentLocation = locations.first else { return }
            locationManager.stopUpdatingLocation()
            viewModel?.loadDate(lat: currentLocation.coordinate.latitude, lng: currentLocation.coordinate.longitude)
        }
    }
}
