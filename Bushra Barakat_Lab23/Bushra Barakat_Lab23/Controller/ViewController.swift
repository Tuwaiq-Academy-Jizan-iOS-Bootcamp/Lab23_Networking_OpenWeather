//
//  ViewController.swift
//  Bushra Barakat_Lab23
//
//  Created by Bushra Barakat on 23/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempreturelabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cloudIconImageView: UIImageView!
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var weatherStatus : [WeatherStatus] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cityNameTextField.delegate = self
       
        
    }

    func getData(city:String){
//        let baseURL = "api.openweathermap.org/data/2.5/weather?q=\(cityNameTextField)&appid=d84355ba4ca88c56b30c9565d4a03707"
        
        if let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=138e26a10db2ee3f422531888af08f17"){
            print("was the URL in correct format")
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data,response, error in
                if let error = error {
                    print("ERROR", error.localizedDescription)
                }else{
                    print ("dowe have data",data)
                    if let safeData = data {
                    print(String(data:safeData, encoding: .utf8))
                        do{
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(WeatherStatus.self, from: safeData)
                            DispatchQueue.main.async {
                                self.cityNameLabel.text = decodedData.name
                                self.tempreturelabel.text = String(format: "%.0f", decodedData.main.temp - 273.15) + "℃"
                                print ("\(decodedData.main.temp)")
                                self.descriptionLabel.text = decodedData.weather[0].description
                                print (decodedData.weather[0].description)
                                
                        }
                    } catch {
                        print("somthing wrong", String(describing: error))
                    }
                }
            }
        }
        task.resume()

    }
}
    @IBAction func button(_ sender: UIButton) {
        if let city = cityNameTextField.text{
            getData(city: city)
            
        }
}
}
extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityNameTextField.resignFirstResponder()
        return true
    }
}


