//
//  WeatherDetailsInfoView.swift
//  WeatherForecast
//
//  Created by Fatema El Zahraa on 11/12/20.
//

import UIKit

class WeatherDetailsInfoView: UIView {
    //MARK:- Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lKeyLabel: UILabel!
    @IBOutlet weak var lValueLabel: UILabel!
    @IBOutlet weak var rKeyLabel: UILabel!
    @IBOutlet weak var rValueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("WeatherDetailsInfoView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    func updateWith(rValue: (String, String?)?, lValue: (String, String?)?) {
        lKeyLabel.text = lValue?.0 ?? ""
        lValueLabel.text = lValue?.1 ?? ""
        
        rKeyLabel.text = rValue?.0 ?? ""
        rValueLabel.text = rValue?.1 ?? ""
    }
}
