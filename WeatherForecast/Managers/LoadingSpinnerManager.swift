//
//  LoadingSpinnerManager.swift
//  VitalCheckUp-IOS
//
//  Created by Ahmed masoud on 11/6/19.
//  Copyright © 2019 Ahmed Masoud. All rights reserved.
//

import Foundation
import UIKit

class LoadingSpinnerManager {
    //MARK: Properties
    
    private var loadingSpinner: UIActivityIndicatorView?
    private var containerView: UIView?
    
    //MARK: Singleton
    static let shared = LoadingSpinnerManager()
    
    private init() { }
    
    //MARK: Methods
    func show() {
        if loadingSpinner != nil { return }
        guard let window = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first else { return }
        containerView = UIView(frame: window.bounds)
        loadingSpinner = UIActivityIndicatorView(style: .large)
        loadingSpinner?.color = .white
        guard let view = containerView else { return }
        guard let spinner = loadingSpinner else { return }
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        spinner.startAnimating()
        view.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        window.addSubview(view)
    }
    
    func hide() {
        loadingSpinner?.removeFromSuperview()
        containerView?.removeFromSuperview()
        loadingSpinner = nil
        containerView = nil
    }
    
}
