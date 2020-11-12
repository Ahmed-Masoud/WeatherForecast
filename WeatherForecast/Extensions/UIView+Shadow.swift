//
//  UIView+Shadow.swift
//  VitalCheckUp-IOS
//
//  Created by Ahmed masoud on 4/12/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setShadow(offsetHeight: CGFloat = 5, radius: CGFloat = 20) {
        self.layer.shadowOffset = CGSize(width: 0, height: offsetHeight)
        self.layer.shadowColor = UIColor(red:0, green:0, blue:0, alpha:0.15).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = radius
        self.clipsToBounds = false
    }
}
