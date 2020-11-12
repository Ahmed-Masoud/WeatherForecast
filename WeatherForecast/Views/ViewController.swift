//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let provider = WeatherProvider()
        provider.getForecast(lat: 37.33233141, lng: -122.0312186) { (result) in
            switch result {
            case .success(let weather):
                print(weather?.currently.summary)
            case .failure(let error):
                print(error)
            }
        }
    }


}

