//
//  FutureDayDetailsVC.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class FutureDayDetailsVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var detailsStack: UIStackView!
    
    //MARK:- Properties
    private var facts: [((String, String?),(String, String?))]?
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFacts()
    }
    
    //MARK:- Methods
    class func create(facts: [((String, String?),(String, String?))]?) -> FutureDayDetailsVC {
        let currentVC: FutureDayDetailsVC = UIViewController.create(storyboardName: StoryBoard.main, identifier: "\(FutureDayDetailsVC.self)")
        currentVC.facts = facts
        return currentVC
    }
    
    private func setupFacts() {
        let factsContainers = [
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView(),
            WeatherDetailsInfoView()
        ]
        for (index, container) in factsContainers.enumerated() {
            let fact = facts?[index]
            container.updateWith(fact: fact)
            detailsStack.addArrangedSubview(container)
        }
    }
    
}
