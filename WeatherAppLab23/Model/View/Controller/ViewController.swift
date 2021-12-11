//
//  ViewController.swift
//  WeatherAppLab23
//
//  Created by Abdulrhman Abuhyyh on 08/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var weatherDecreption: UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var searchBar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherSearcher("Jazan")
        searchBar.returnKeyType = .search
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
    }
    @IBAction func searchButton(_ sender: Any) {
        if let city = searchBar.text {
            weatherSearcher(city)
        }
    }
    func weatherSearcher(_ City: String) {
        let weatherCity = "https://api.openweathermap.org/data/2.5/weather?q=\(City)&appid=6a65f5c8a621df097dc42a61da623019&units=metric"
        if let urlResponse = URL(string: weatherCity) {
            let urlSession = URLSession(configuration: .default)
            let urlTask = urlSession.dataTask(with: urlResponse) { data, response, error in
                if let error = error {
                    print("Bad URL", error.localizedDescription)
                }else {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let weatherData = try decoder.decode(MainWeatherAPI.self, from: safeData)
                            DispatchQueue.main.async {
                                self.cityName.text = weatherData.name
                                self.temp.text = "\(weatherData.main.temp) C"
                                self.weatherDecreption.text = weatherData.weather[0].description
                            }
                        } catch{
                            print("Bad JSON Struct Or URL",error.localizedDescription)
                        }
                        
                    }
                }
            }
            urlTask.resume()
        }
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let city = searchBar.text {
            weatherSearcher(city)
        }
        textField.resignFirstResponder()
        return true
    }
}
