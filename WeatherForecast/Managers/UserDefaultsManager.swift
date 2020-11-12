//
//  UserDefaultsManager.swift
//  VitalCheckUp-IOS
//
//  Created by Ahmed Masoud on 1/19/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    //MARK: Singleton
    static let shared = UserDefaultsManager()
    
    private struct UserDefaultsKeys {
        static let firstTime = "UDKFirstTime"
        static let didGetOriented = "UDKOrientation"
    }
    
    //MARK: Properties
    var isFirstTime:Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.firstTime)
        }
        get{
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.firstTime) != nil else {
                return true
            }
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.firstTime)
        }
    }
    
    var didGetOriented:Bool {
        set{
            UserDefaults.standard.set(newValue, forKey: UserDefaultsKeys.didGetOriented)
        }
        get{
            guard UserDefaults.standard.object(forKey: UserDefaultsKeys.didGetOriented) != nil else {
                return false
            }
            return UserDefaults.standard.bool(forKey: UserDefaultsKeys.didGetOriented)
        }
    }
    
}

