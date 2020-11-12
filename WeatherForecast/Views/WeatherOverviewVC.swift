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
            LoadingSpinnerManager.shared.show()
            viewModel?.loadDate(lat: currentLocation.coordinate.latitude, lng: currentLocation.coordinate.longitude)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            let alert = UIAlertController(title: "Location Access Denied", message: "Accessing your current location is mandatory for the app to operate", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }))
            self.present(alert, animated: true, completion: nil)
        case .authorizedAlways:
            print("Is not requested")
        case .authorizedWhenInUse:
            print("Fine")
        }
    }
}
