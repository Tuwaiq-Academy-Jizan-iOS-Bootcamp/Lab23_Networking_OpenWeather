//
//  ViewController.swift
//  Fatan_Networking_OpenWeather
//
//  Created by Faten Abdullh salem on 02/05/1443 AH.
//

import UIKit
class ViewController: UIViewController {
@IBOutlet weak var SearchCity: UITextField!
@IBOutlet weak var NameCity: UILabel!
@IBOutlet weak var weatherCondition: UILabel!
@IBOutlet weak var temperature: UILabel!
    

override func viewDidLoad() {
    super.viewDidLoad()
    weatherSearcher("")
    SearchCity.returnKeyType = .search
    SearchCity.becomeFirstResponder()
    SearchCity.delegate = self
}
    
      @IBAction func SearchButton(_ sender: Any) {
       
    if let city = SearchCity.text {
        weatherSearcher(city)
        
    }
}
    
func weatherSearcher(_ City: String) {
let weatherCity =  "https://api.openweathermap.org/data/2.5/weather?q=\(City)&appid=6a65f5c8a621df097dc42a61da623019&units=metric"
    
//   Step 1 URL
if let urlResponse = URL(string: weatherCity) {
    
// step 2 Session
let urlSession = URLSession(configuration: .default)
    
// step 3 Task
    
let urlTask = urlSession.dataTask(with: urlResponse) { data, response, error in
    if let error = error {
    

print(" ⚠️ NOT URL ⚠️", error.localizedDescription)
        }else {
if let safeData = data {

    do {
    let decoder = JSONDecoder()
let weatherData = try decoder.decode(InfoWeathar.self, from: safeData)
            
        DispatchQueue.main.async {
        self.NameCity.text = weatherData.name
        self.temperature.text = "\(weatherData.main.temp) C"
        self.weatherCondition.text = weatherData.weather[0].description
            
        }
    } catch {
        print("JSON-URL",error.localizedDescription)
        }
    }
}
    
}
    
// Step 4 urlTask.resume()
    
    urlTask.resume()
}
}
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let city = SearchCity.text {
            weatherSearcher(city)
        }
        textField.resignFirstResponder()
        return true
    }
}
