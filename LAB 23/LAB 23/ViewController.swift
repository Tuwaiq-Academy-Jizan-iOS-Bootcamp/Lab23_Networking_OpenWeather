//
//  ViewController.swift
//  LAB 23
//
//  Created by زهور حسين on 05/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lablediscription: UILabel!
    @IBOutlet weak var textfildnamecity: UITextField!
    
    @IBOutlet weak var lablecityname: UILabel!
    
    
    @IBOutlet weak var lableTemperature: UILabel!
   var city = ""
  //  var arrayweather = Weatherinfo
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        textfildnamecity.delegate = self
        // Do any additional setup after loading the view.
        getData(with: city)
    }
    func getData (with city:String){
        print("\(city)")
        // 1. create url
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f14b715caa9c08032a74e0eba9826882&units=metric"
        print(baseURL)
        if let url = URL(string: baseURL) {
            print("WAS THE URL IN CORRECT FORMAT")
            print(url)
            //2. create a URL Session
            let session = URLSession(configuration: .default)
            //3 create a task
            let task = session.dataTask(with: url) {  data , response, error  in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    if let safeData = data {
                //  print(String(data: safeData, encoding: .utf8))
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(Weatherinfo.self, from: safeData)

                            DispatchQueue.main.async {
                                self.lablecityname.text = decodedData.name
                                print(decodedData.name)
                               // let templable = decodedData.temp
                                self.lablediscription.text = decodedData.weather[0].description
                                print(decodedData.weather[0].description)
                                self.lableTemperature.text = "\(decodedData.main.temp)"
                           
                            print("DECODED DATA",decodedData)
                            }
                            }catch {
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                            }
                        
                    }
                }
            }
            //4. start/resume the task
            task.resume()
        }
    }
    
 @IBAction func displaybutton(_ sender: UIButton) {
        
    if let city = textfildnamecity.text{
        getData(with: city)

    }
 }
}
extension ViewController: UITextFieldDelegate {
    func textfildnamecity(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

