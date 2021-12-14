//
//  ViewController.swift
//  JazanWeather
//
//  Created by Yasir Hakami on 13/12/2021.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var degree: UILabel!
    @IBOutlet weak var sky: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.returnKeyType = .search
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
//        getData("jazan")
      
    }
    @IBAction func searchButten(_ sender: Any) {
        if let city = searchBar.text {
            getData(city)
        }
    }
    
    func getData(_ endPoint:String){
        let baseUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(endPoint)&appid=6a65f5c8a621df097dc42a61da623019&units=metric"
        if let url = URL(string: baseUrl + endPoint){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, respons, error in
                if let error = error {
                    print("ERROR", error.localizedDescription)
                }else{
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let decode = try decoder.decode(MainWeatherAPI.self, from: safeData)
                            print(decode)
                            DispatchQueue.main.async {
                                self.cityName.text = decode.name
                                self.degree.text = "\(decode.main.temp) C"
                                self.sky.text = decode.weather[0].description
                            }
                        }catch{
                            print("SOTHING WENT WRONG!!", error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
       
    }
    
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let city = searchBar.text {
            getData(city)
        }
        textField.resignFirstResponder()
        return true
    }
}
