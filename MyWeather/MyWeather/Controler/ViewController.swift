

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var searchCity: UITextField!
    @IBOutlet weak var weatherCondition: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherSearcher("")
        searchCity.returnKeyType = .search
        searchCity.becomeFirstResponder()
        searchCity.delegate = self
    }
    @IBAction func searchButton(_ sender: Any) {
        if let city = searchCity.text {
            weatherSearcher(city)
        }
    }
    func weatherSearcher(_ City: String) {

  let weatherCity = "https://api.openweathermap.org/data/2.5/weather?q=\(City)&appid=6a65f5c8a621df097dc42a61da623019&units=metric"
//        Step 1 URL
        if let urlResponse = URL(string: weatherCity) {
//            step 2 Session
            let urlSession = URLSession(configuration: .default)
//            step 3 Task
            let urlTask = urlSession.dataTask(with: urlResponse) { data, response, error in
                if let error = error {
                    
                    print(" ⚠️ NOT URL ⚠️", error.localizedDescription)
                }else {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let weatherData = try decoder.decode(InfoWeathar.self, from: safeData)
//  An object that manages the execution of tasks serially or concurrently on your app's main thread or on a background thread.
                            
                            DispatchQueue.main.async {
                                self.cityName.text = weatherData.name
                                self.temperature.text = "\(weatherData.main.temp) C"
                                self.weatherCondition.text = weatherData.weather[0].description
                            }
                        } catch {
                            print("JSON-URL",error.localizedDescription)
                        }
                        
                    }
                }
            }
//            Step 4 urlTask.resume()
            urlTask.resume()
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let city = searchCity.text {
            weatherSearcher(city)
        }
        textField.resignFirstResponder()
        return true
    }
}

