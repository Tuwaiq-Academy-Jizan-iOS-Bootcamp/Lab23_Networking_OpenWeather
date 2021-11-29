//
//  ViewController.swift
//  HananSomilyOpenWeather
//
//  Created by Hanan Somily on 27/11/2021.
//

import UIKit

class ViewController: UIViewController  {

    
var weatherManger = WeatherCity()
    @IBOutlet weak var insertCityTextField: UITextField!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var CloudImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherManger.delegate = self
    }
    
    @IBAction func searchButton(_ sender: Any) {
        if let city = insertCityTextField.text {
            weatherManger.fithchCity(cityName: city)
        }
        
    }
  
}

extension ViewController: WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager: WeatherCity, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.cityName
            self.temperatureLable.text = weather.temperaterString
            self.CloudImage.image = UIImage(systemName: weather.coditionals)
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
