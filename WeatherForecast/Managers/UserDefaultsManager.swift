//
//  UserDefaultsManager.swift
//  VitalCheckUp-IOS
//
//  Created by Ahmed Masoud on 1/19/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation

enum DegreeType: String {
    case centigrade = "centigrade"
    case fahrenheit = "fahrenheit"
}

class UserDefaultsManager {
    
    //MARK: Singleton
    static let shared = UserDefaultsManager()
    
    private struct UserDefaultsKeys {
        static let degreeType = "UDKDegreeType"
    }
    
    //MARK: Properties
    var degreeType: DegreeType {
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: UserDefaultsKeys.degreeType)
        }
        get {
            let rawType = UserDefaults.standard.string(forKey: UserDefaultsKeys.degreeType)
            guard let safeRawType = rawType, let safeDegreeType = DegreeType(rawValue: safeRawType) else {
                // Defaults to Fahrenheit
                return .fahrenheit
            }
            return safeDegreeType
        }
    }
    
}

