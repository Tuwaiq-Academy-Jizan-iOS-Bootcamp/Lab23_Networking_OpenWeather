//
//  ViewController.swift
//  JawaherAbuLahsah_Lab23_OpenWeather
//
//  Created by Jawaher Mohammad on 20/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityInputTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityInputTextField.delegate = self
    }
    @IBAction func addCityButton(_ sender: UIButton) {
        if let city = cityInputTextField.text {
        getData(city)
        }
    }
    
    
    func getData(_ city : String){
            let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=138e26a10db2ee3f422531888af08f17")
            if let url = url {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, respon, error in
                    if let error = error {
                        print("ERROR",error.localizedDescription)
                    }else{
                        if let data = data {
                            do {
                                let codable = JSONDecoder()
                                let decodable = try codable.decode(OpenWeath.self, from: data)
                                print(decodable)
                                
                                DispatchQueue.main.async {
                                    self.cityNameLabel.text = decodable.name
                                    self.descriptionLabel.text = decodable.weather[0].description
                                    self.temperatureLabel.text = String(format: "%.0f", decodable.main.temp - 273.15)
                                }
                            } catch  {
                                print("ERROR...")
                            }
                        }
                    }
                }
                task.resume()
            }
        }
}
extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
