//
//  FutureDayDetailsView.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class FutureDayDetailsView: UIView {
    //MARK:- Outlets
    @IBOutlet weak var detailsStack: UIStackView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherState: UILabel!
    @IBOutlet weak var contentTable: UITableView!
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        contentTable.backgroundColor = .clear
        currentWeatherIcon.kf.indicatorType = .activity
    }
    
    //MARK:- Methods
    func updateView(with currentWeather: DailyWeatherVMProtocol?) {
        currentWeatherIcon.kf.setImage(with: URL(string: currentWeather?.details?.icon ?? ""),
        options : [ .transition(.fade(1)) ])
        currentTempLabel.text = currentWeather?.temp?.avg
        currentWeatherState.text = currentWeather?.details?.weatherHighlight
        buildFacts(for: currentWeather)
    }
    
    private func buildFacts(for currentWeather: DailyWeatherVMProtocol?) {
        detailsStack.subviews.forEach({$0.removeFromSuperview()})
        let factsContainers = [
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView()
        ]
        for (index, container) in factsContainers.enumerated() {
            container.updateWith(fact: currentWeather?.facts?[index])
            detailsStack.addArrangedSubview(container)
        }
    }
    
}
