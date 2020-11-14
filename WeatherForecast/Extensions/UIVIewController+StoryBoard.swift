//
//  UIVIewController+StoryBoard.swift
//  WeatherForecast
//
//  Created by Ahmed Masoud on 11/14/20.
//

import Foundation
import  UIKit

extension UIViewController {
    class func create<T: UIViewController>(storyboardName: String, identifier: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
