//
//  DetailViewController.swift
//  WeatherAPP
//
//  Created by يوسف جابر المالكي on 16/05/1443 AH.
//

import UIKit

class DetailViewController: UIViewController {

    var city = String()
    
    @IBOutlet weak var cityNameLable: UILabel!
    @IBOutlet weak var weatherLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityNameLable.text = city
        getTodayResult(cityName: city)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
           self.navigationController?.navigationBar.isHidden = false
        
    }
    
    func getTodayResult(cityName: String) {
        
        if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=0f6112b1d663b03202ffabe9788c51ef") {
            
            let request = URLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error == nil {
                    
                    if let getData = data {
                        
                        do {
                            let json = try JSONSerialization.jsonObject(with: getData, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                            
                            //print(json)
                            
                            if let main = json["main"] as? NSDictionary {
                                
                                if let temp = main["temp"] as? Double {
                                   
                                    let state = Int(temp - 273.15)
                                    
                                    DispatchQueue.main.sync {
                                        self.weatherLable.text = String(state)
                                    }
                                    
                                }
                                
                            }
                            
                            
                        }catch{
                            print("error")
                        }
                        
                    }
                    
                }
                
            }
            task.resume()
            
        }
        
        
    }


}
