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

        insertNameCityTextField.delegate = self
    }
    @IBAction func searchBotten(_ sender: UIButton) {
        let cityName = insertNameCityTextField.text
            getData(with: cityName!)
    }

    func getData(with city:String){
       // city = cityName!
        print(city)
       let link = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=f6ce6c8f34260d59dc97216fd711822d&units=metric"
//        request(whith: link)
//        print(link) }
//        func request(whith link : String){
print(link)
        if let url = URL(string: link) {
            print("WAS THE URL IN CORRECT FORMAT", link)

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {  data , response, error  in
                if let error = error {
                    print("ERROR",error.localizedDescription)
                }else {
                  //  print("DO WE HAVE DATA",data)
                    if let safeData = data {
                        do {
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(WeatherData.self, from: safeData)
                            print("DECODED DATA",decodedData)

                            DispatchQueue.main.async {
            self.nameCityLabel.text = decodedData.name
                                print(decodedData.name)
            self.temperaterLabel.text = String(format:"%.0f", decodedData.main.temp )
                                print(decodedData.main.temp)
                            }
                        }catch{
                            print("SOMETHING WENT WRONG",error.localizedDescription)
                    }
                  }
                }
            }
        task.resume()
    }
}
}
//    @IBAction func searchBotten(_ sender: UIButton) {
//        if let city = insertNameCityTextField.text {
//            getData(with: city)
//           // nameCityLabel.text = cityName
//    }
//  }
//}
extension ViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
