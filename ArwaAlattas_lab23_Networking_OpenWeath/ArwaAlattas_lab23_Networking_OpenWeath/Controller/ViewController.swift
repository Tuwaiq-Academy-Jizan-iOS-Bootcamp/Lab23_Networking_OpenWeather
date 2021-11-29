//
//  ViewController.swift
//  ArwaAlattas_lab23_Networking_OpenWeath
//
//  Created by Arwa Alattas on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var discrTemp: UILabel!
    @IBOutlet weak var cityName: UITextField!{
        didSet{
            cityName.delegate = self
        }
    }
    
    @IBAction func gitTemp(_ sender: Any) {
        
        if let cityNam = cityName.text{
           getDetils(cityName: cityNam)
        }
 
    }
    func getDetils(cityName:String){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=a96e19e6c3f8ee61eaa18fea91ea2653" )
        if let url = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else{
                    if let safeData = data{
                        do {
                            let decoder = JSONDecoder()
                            let decodeData = try decoder.decode(CurrentWeather.self, from: safeData)
                            print(decodeData)
                            DispatchQueue.main.async {
                    self.tempLabel.text = String(decodeData.main.temp)
                    self.discrTemp.text = decodeData.weather[0].description
                                                      }
                        } catch  {
                            print("SOMTHING WRONG",error.localizedDescription)
                        }
                        
                    }
                }
            }
            task.resume()
            
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension ViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
