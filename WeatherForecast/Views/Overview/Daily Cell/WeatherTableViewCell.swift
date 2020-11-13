//
//  WeatherTableViewCell.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/12/20.
//

import UIKit
import Kingfisher

class WeatherTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var lowTempLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!

    //MARK:- Properties
    var dailyVM: DailyWeatherVMProtocol? {
        didSet {
            self.lowTempLabel.text = dailyVM?.temp?.min
            self.highTempLabel.text = dailyVM?.temp?.max
            self.dayLabel.text = dailyVM?.dayDate

            iconImageView.kf.setImage(with: URL(string: dailyVM?.details?.icon ?? ""),
            options : [ .transition(.fade(1)) ])
        }
    }
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.kf.indicatorType = .activity
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
    }

    //MARK:- Methods
    static func nib() -> UINib {
        return UINib(nibName: "\(WeatherTableViewCell.self)",
                     bundle: nil)
    }
    
}
