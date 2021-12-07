//
//  ViewController.swift
//  NouraLab23
//
//  Created by NoON .. on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameCityTF: UITextField!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weatherConditionLable: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton("")
        nameCityTF.returnKeyType = .search
        nameCityTF.becomeFirstResponder()
        nameCityTF.delegate = self
    }
    @IBAction func searchButton(_ sender: Any) {
        if let city = nameCityTF.text {
            searchWeather(nameCityTF: city)
        }
    }
    func searchWeather(nameCityTF:String){
        print("\(nameCityTF)")
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(nameCityTF)&appid=a96e19e6c3f8ee61eaa18fea91ea2653" )
                 if let url = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(" NOT URL",error.localizedDescription)
                }else{
                    if let safeDate = data {
                        do {
                            let decoder = JSONDecoder()
                            let weatherData = try decoder.decode(WeatherCity.self, from: safeDate)
                            DispatchQueue.main.async{
                                self.cityNameLabel.text = weatherData.name
                                self.temperature.text = "\(weatherData.main.temp)c"
                                self.weatherConditionLable.text = weatherData.weather[0].description
                            }
                        } catch{
                            print("JSON-URL")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField:UITextField)-> Bool{
        textField.resignFirstResponder()
        return true
    }
}
