//
//  ViewController.swift
//  lab24 _ the Weather
//
//  Created by Amal Jeli on 26/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameOfCity: UITextField!
    
    @IBOutlet weak var temperature: UILabel!

    @IBOutlet weak var weatherConditionLable: UILabel!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    override func viewDidLoad() {
             super.viewDidLoad()
             searchButton("")

        nameOfCity.returnKeyType = .search
        nameOfCity.becomeFirstResponder()
        nameOfCity.delegate = self
         }
         @IBAction func searchButton(_ sender: Any) {
             if let city = nameOfCity.text {
                 searchWeather(nameOfCity: city)
             }
         }
         func searchWeather(nameOfCity:String){
             print("\(nameOfCity)")
             let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(nameOfCity)&appid=a96e19e6c3f8ee61eaa18fea91ea2653" )
                      if let url = url {
                 let session = URLSession(configuration: .default)
                 let task = session.dataTask(with: url) { data, response, error in
                     if let error = error {
                         print("",error.localizedDescription)
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
                                 print("")
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



