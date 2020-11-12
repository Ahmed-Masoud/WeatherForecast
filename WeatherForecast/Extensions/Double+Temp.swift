//
//  Double+Temp.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import Foundation

extension Double {
    func asTemp() -> String {
        let type = UserDefaultsManager.shared.degreeType
        switch type {
        case .centigrade:
            return "\(self.asCentigrade())\u{00B0}"
        case .fahrenheit:
            return "\(self.asFahrenhite())\u{00B0}"
        }
    }
    
    private func asFahrenhite() -> Int {
        Int((self + 32) * 9/5)
    }
    
    private func asCentigrade() -> Int {
        Int((self - 32) * 5/9)
    }
}