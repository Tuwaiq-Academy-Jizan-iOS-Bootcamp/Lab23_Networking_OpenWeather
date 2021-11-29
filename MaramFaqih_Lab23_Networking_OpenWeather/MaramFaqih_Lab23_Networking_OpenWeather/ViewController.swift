//
//  ViewController.swift
//  MaramFaqih_Lab23_Networking_OpenWeather
//
//  Created by meme f on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
   // var wetherTemp : CityInfo
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getaData(with:"jizan")
        cityLabel.text = "jizan"
       // tempLabel.text = String(wetherTemp.main.temp)
    }

   

func getaData(with city:String){
    
    let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f21c321a43f2092077b4a93cbfeaecda&units=metric"
   if let url = URL(string: baseURL) {
    let session = URLSession(configuration: .default)
   
    let task = session.dataTask(with: url){ data, respons, error in
        if let error = error {
            print("error",error.localizedDescription)
        }else{
            if let safeData = data {
                do{
                       let decoder = JSONDecoder()
                      
                       let decoderData = try decoder.decode(CityInfo.self, from: safeData)
                       
                       print("decoderData:",decoderData )
                           DispatchQueue.main.async {

                               DispatchQueue.main.async {

                               self.tempLabel.text = String(Int(decoderData.main.temp))
                                   print(decoderData.main.temp)
                                   self.descriptionLabel.text = (decoderData.weather[0].description)
                                   print(decoderData.weather[0].description)
                               }
                           
                            

}
                

                } catch{
                    print("error missing",error.localizedDescription)
                    DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        
                            self.cityLabel.text = "invalid data"
                        }
                    }
                               }
                           }
                       }
                    }
                           task.resume()
                       }
                }
    
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        let cityName = cityNameTextField.text
        
        getaData(with:cityName!)
        cityLabel.text = cityName!
        
        
    }
    
    
    
                }



