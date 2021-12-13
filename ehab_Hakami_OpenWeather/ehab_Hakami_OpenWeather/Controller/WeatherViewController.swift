//
//  WeatherViewController.swift
//  ehab_Hakami_OpenWeather
//
//  Created by Ehab Hakami on 09/05/1443 AH.
//

import UIKit

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchTextField.delegate = self
        setViewsDesign()
    }
    //MARK: - Design
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var degreeView: UIView!
    
    
    func setViewsDesign(){
        
        searchView.layer.cornerRadius = 15
        searchView.layer.shadowColor = UIColor.lightGray.cgColor
        searchView.layer.shadowOpacity = 0.2
        searchView.layer.shadowOffset = .zero
        searchView.layer.shadowRadius = 5
        
        
        let lineView = UIView(frame: CGRect(x:0,
                                            y:  self.degreeView.frame.height,
                                            width: self.degreeView.frame.width,
                                            height: 1
                                           )
        )
        
        lineView.backgroundColor = UIColor.black
        self.degreeView.addSubview(lineView)
        
    }
}




extension WeatherViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
        
    }
    
}


//MARK: - WeatherManagerDelegate


extension WeatherViewController: WeatherManagerDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - CLLocationManagerDelegate


extension WeatherViewController: CLLocationManagerDelegate {
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}


