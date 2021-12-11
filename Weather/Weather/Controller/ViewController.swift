//
//  ViewController.swift
//  Weather
//
//  Created by Afrah Omar on 29/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var temperLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var searshTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLable.text = "Jizan"
        getData(with: "Jizan")
    }
    
    @IBAction func searshButton(_ sender: Any) {
        let city = searshTextField.text
     getData(with: city!)
        cityNameLable.text = city!
    }
    
    func getData(with nameOfCity:String){
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(nameOfCity)&appid=365923d0112c248827cf9745c62ec2f7&units=metric"
        if let url = URL(string: baseURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode (InfoWeathar.self, from: safeData)
                            print("DECODED DATA",decodedData.weather[0])
                            DispatchQueue.global().async {

                                DispatchQueue.main.async {

        self.temperLabel.text = String(Int(decodedData.main.temp))
                                
        self.discriptionLabel.text = (decodedData.weather[0].description)
                                                          }
                                                       
                                                        

                            }
                            
                        } catch {
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                        }
                        
                    }
                }
            }
          
            task.resume()
        }
    }
    
}
