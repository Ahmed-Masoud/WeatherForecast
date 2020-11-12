//
//  FutureDayDetailsVC.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class FutureDayDetailsVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet var futureDayDetailsView: FutureDayDetailsView!
    
    //MARK:- Properties
    private var dayWeather: DailyWeatherVMProtocol?
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        futureDayDetailsView.updateView(with: dayWeather)
    }
    
    //MARK:- Methods
    class func create(dayWeather: DailyWeatherVMProtocol?) -> FutureDayDetailsVC {
        let currentVC: FutureDayDetailsVC = UIViewController.create(storyboardName: StoryBoard.main, identifier: "\(FutureDayDetailsVC.self)")
        currentVC.dayWeather = dayWeather
        return currentVC
    }
    
}
