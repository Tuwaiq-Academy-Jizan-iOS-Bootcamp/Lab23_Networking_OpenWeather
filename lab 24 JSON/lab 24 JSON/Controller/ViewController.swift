//
//  ViewController.swift
//  lab 24 JSON
//
//  Created by grand ahmad on 22/04/1443 AH.
//

import UIKit


let APIKEY = "507e4167c1743d1d6e8a2fce083981cb"
class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var searchCityTextField: UITextField!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var listArr = [Welcome]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchCityTextField.delegate = self
    }

    @IBAction func searchAction(_ sender: Any) {
       if let city = searchCityTextField.text {
           getData(city: city)
        }
    }
    
    func getData(city :String){
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=507e4167c1743d1d6e8a2fce083981cb"
        if let ur1 = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: ur1) { data, response, error in
                if let error = error {
                    print("Error", error.localizedDescription)
                } else {
                    if let safeDate = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(Welcome.self, from: safeDate)
                            print("decord data",decodedData)
                           // self.listArr = decodedData
                            
                            DispatchQueue.main.async {
//                                self.tableViewData.reloadData()
                                self.cityLabel.text =
                                decodedData.name
                                self.descriptionLabel.text =
                                decodedData.weather[0].description
                                self.temperatureLabel.text =
                                String(format: "%.0f", decodedData.main.temp - 273.15) + "C"
                            }
                        } catch {
                            print("SOMETHING WENT WRONG", error.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

