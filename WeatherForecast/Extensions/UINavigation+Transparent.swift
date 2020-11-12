//
//  UINavigation+Transparent.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation
import UIKit

extension UINavigationController {
    func makeTransparent() {
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.backgroundColor = .clear
        self.navigationBar.isTranslucent = true
        self.navigationBar.tintColor = .white
    }
}
