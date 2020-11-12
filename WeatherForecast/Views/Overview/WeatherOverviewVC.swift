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
    @IBOutlet var weatherOverviewView: WeatherOverviewView!
    
    //MARK:- Properties
    private var viewModel: WeatherOverviewViewModelProtocol?
    private let locationManager = CLLocationManager()
    private let collectionCellHeight: CGFloat = 100
    private let collectionCellWidth: CGFloat = 160
    private var currentWeather: WeatherVMProtocol? {
        viewModel?.currentWeather
    }
    private var hourlyWeather: [WeatherVMProtocol]? {
        viewModel?.hourlyWeather
    }
    private var dailyWeather: [DailyWeatherVMProtocol]? {
        viewModel?.dailyWeather
    }
    
    //MARK:-LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarItems()
        setupBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLocation()
    }

    //MARK:- Methods
    class func create(viewModel: WeatherOverviewViewModelProtocol) -> WeatherOverviewVC {
        let currentVC: WeatherOverviewVC = UIViewController.create(storyboardName: StoryBoard.main, identifier: "\(WeatherOverviewVC.self)")
        viewModel.setDependencies(provider: WeatherProvider())
        currentVC.viewModel = viewModel
        return currentVC
    }
    
    private func setupBarItems() {
        let button = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .plain, target: self, action: #selector(openSettings))
        button.tintColor = .white
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc private func openSettings() {
        let settings = SettingsVC.create()
        self.navigationController?.pushViewController(settings, animated: true)
    }
    
    private func setupBinding() {
        viewModel?.didFetchData = didFetchData
        viewModel?.didFail = didFail
    }
    
    private func didFetchData() {
        weatherOverviewView.updateView(with: currentWeather)
        weatherOverviewView.contentTable.reloadData()
        weatherOverviewView.hoursCollection.reloadData()
        LoadingSpinnerManager.shared.hide()
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

extension WeatherOverviewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyWeather?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(WeatherTableViewCell.self)", for: indexPath) as? WeatherTableViewCell, let dayWeather = dailyWeather?[indexPath.row] else { return UITableViewCell() }
        cell.dailyVM = dayWeather
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dayWeather = dailyWeather?[indexPath.row] else { return }
        let detailsVC = FutureDayDetailsVC.create(dayWeather: dayWeather)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension WeatherOverviewVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyWeather?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HourlyCollectionViewCell.self)", for: indexPath) as? HourlyCollectionViewCell, let hourlyWeather = hourlyWeather?[indexPath.row] else { return UICollectionViewCell() }
        cell.hourlyVM = hourlyWeather
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionCellWidth, height: collectionCellHeight)
    }
    
}
