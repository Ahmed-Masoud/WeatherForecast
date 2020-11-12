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
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK:- Methods
    private func setupUI() {
        contentTable.rowHeight = UITableView.automaticDimension
        contentTable.estimatedRowHeight = 600
        contentTable.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: "\(WeatherTableViewCell.self)")
    }

}
