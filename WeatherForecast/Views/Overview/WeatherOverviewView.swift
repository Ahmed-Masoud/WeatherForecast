//
//  WeatherOverviewView.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class WeatherOverviewView: UIView {

    //MARK:- Outlets
    @IBOutlet weak var contentTable: UITableView!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentWeatherState: UILabel!
    @IBOutlet weak var infoStack: UIStackView!
    @IBOutlet weak var hoursCollection: UICollectionView!
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK:- Methods
    private func setupUI() {
        contentTable.backgroundColor = .clear
        contentTable.rowHeight = UITableView.automaticDimension
        contentTable.estimatedRowHeight = 600
        contentTable.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: "\(WeatherTableViewCell.self)")
        hoursCollection.register(HourlyCollectionViewCell.nib(), forCellWithReuseIdentifier: "\(HourlyCollectionViewCell.self)")
        hoursCollection.backgroundColor = .clear
        currentWeatherIcon.kf.indicatorType = .activity
    }
    
    func updateView(with currentWeather: WeatherVMProtocol?) {
        currentWeatherIcon.kf.setImage(with: URL(string: currentWeather?.details?.icon ?? ""),
        options : [ .transition(.fade(1)) ])
        currentTempLabel.text = currentWeather?.temp
        currentWeatherState.text = currentWeather?.details?.weatherHighlight
        buildFacts(for: currentWeather)
    }
    
    private func buildFacts(for currentWeather: WeatherVMProtocol?) {
        infoStack.subviews.forEach({$0.removeFromSuperview()})
        let factsContainers = [
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView()
        ]
        for (index, container) in factsContainers.enumerated() {
            container.updateWith(fact: currentWeather?.facts?[index])
            infoStack.addArrangedSubview(container)
        }
    }

}
