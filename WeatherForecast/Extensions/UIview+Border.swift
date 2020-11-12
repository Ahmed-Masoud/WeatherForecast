//
//  UIview+Border.swift
//  VitalCheckUp-IOS
//
//  Created by Ahmed masoud on 2/2/20.
//  Copyright © 2020 Ahmed Masoud. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addBorder(radius: CGFloat = 1, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = radius
    }
    
    func removeBorder() {
        self.layer.borderWidth = 0.0
    }

    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        self.addSubview(border)
        border.translatesAutoresizingMaskIntoConstraints = false
        border.heightAnchor.constraint(equalToConstant: width).isActive = true
        border.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        border.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        border.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }
    
    
}
