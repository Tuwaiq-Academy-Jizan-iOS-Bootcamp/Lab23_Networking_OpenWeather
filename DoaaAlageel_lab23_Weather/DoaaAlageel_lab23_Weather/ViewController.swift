//
//  ViewController.swift
//  DoaaAlageel_lab23_Weather
//
//  Created by Dua'a ageel on 22/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var temperLablel: UILabel!
    
    @IBOutlet weak var DiscripLable: UILabel!
    
    @IBOutlet weak var cityLable: UILabel!
    
    @IBOutlet weak var searchTextF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLable.text = "jizan"
        getData(with: "jizan")
        
    }

    func getData(with nameOfCity:String){
        print("Is this called??")
        let baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(nameOfCity)&appid=733b872ae07f76dd61d6cbfe85f01da5&units=metric"
        
        if let url = URL(string: baseURL ) {
            print("WAS THE URL IN CORRECT FORMAT")
           
            let session = URLSession(configuration: .default)
           
            let task = session.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                    print("DO WE HAVE DATA",data)
                    if let safeData = data {
//
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode (Mycity.self, from: safeData)
                            print("DECODED DATA",decodedData.weather[0])
                            DispatchQueue.global().async {

                                DispatchQueue.main.async {

        self.temperLablel.text = String(Int(decodedData.main.temp))
                                
        self.DiscripLable.text = (decodedData.weather[0].description)
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
    
    
    
    
    
    @IBAction func searchButton(_ sender: Any) {
        let city = searchTextF.text
     getData(with: city!)
        cityLable.text = city!
        
        
    }
    
    
    

}

