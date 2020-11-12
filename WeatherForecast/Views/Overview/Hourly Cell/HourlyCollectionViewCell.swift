//
//  HourlyCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {
    //MARK:- Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    //MARK:- Properties
    var hourlyVM: WeatherVMProtocol? {
        didSet {
            timeLabel.text = hourlyVM?.timeOfDay
            weatherLabel.text = hourlyVM?.temp
            weatherIcon.kf.setImage(with: URL(string: hourlyVM?.details?.icon ?? ""),
            options : [ .transition(.fade(1)) ])
        }
    }
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        weatherIcon.kf.indicatorType = .activity
    }
    
    //MARK:- Methods
    static func nib() -> UINib {
        return UINib(nibName: "\(HourlyCollectionViewCell.self)",
                     bundle: nil)
    }

}
