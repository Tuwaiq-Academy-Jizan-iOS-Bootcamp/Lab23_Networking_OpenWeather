//
//  CitiesWeatherView.swift
//  JawaherAbuLahsah_Lab23_OpenWeather
//
//  Created by Jawaher Mohammad on 22/04/1443 AH.
//

import Foundation
import UIKit
class CitiesWeatherView:UIViewController{
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    var city = ""
    
    override func viewDidLoad() {
        cityNameLabel.text = city
    }
    
}
