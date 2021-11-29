//
//  ViewController.swift
//  openWeather
//
//  Created by Hanan Somily on 29/11/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var temperaterLabel: UILabel!
    @IBOutlet weak var insertNameCityTextField: UITextField!
    @IBOutlet weak var coludImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData(with: "jazan")
       // nameCityLabel.text = "jazan"
    }
    func getData(with city:String){
        
        let link = " https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f6ce6c8f34260d59dc97216fd711822d"
        print(link)
        if let url = URL(string: link) {
            print("WAS THE URL IN CORRECT FORMAT")

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data , response, error in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(WeatherData.self, from: safeData)

                            DispatchQueue.main.async {
            self.nameCityLabel.text = decodedData.name
                                print(decodedData.name)
            self.temperaterLabel.text = String( decodedData.coord.lat )
                                print(decodedData.coord.lat)
                            }
                            print("DECODED DATA",decodedData)
                        }catch{
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                              self.nameCityLabel.text = "invalid data"
                        }
                      }
                    }
                  }
                }
            }
        task.resume()
    }
    }
    @IBAction func searchBotten(_ sender: UIButton) {
    let cityName = insertNameCityTextField.text
            getData(with: cityName!)
           // nameCityLabel.text = cityName
    }
    
}

