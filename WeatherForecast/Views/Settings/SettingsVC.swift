//
//  SettingsVC.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class SettingsVC: UIViewController {
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK:- Methods
    class func create() -> SettingsVC {
        let currentVC: SettingsVC = UIViewController.create(storyboardName: StoryBoard.main, identifier: "\(SettingsVC.self)")
        return currentVC
    }

    @IBAction func switchDegreeType(_ sender: UIButton) {
        if sender.tag == 0 {
            UserDefaultsManager.shared.degreeType = .centigrade
        } else {
            UserDefaultsManager.shared.degreeType = .fahrenheit
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
