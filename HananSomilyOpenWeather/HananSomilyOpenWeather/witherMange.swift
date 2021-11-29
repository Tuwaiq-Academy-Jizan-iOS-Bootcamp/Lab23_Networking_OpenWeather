//
//  witherMange.swift
//  HananSomilyOpenWeather
//
//  Created by Hanan Somily on 27/11/2021.
//

import Foundation
protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherCity,
weather: WeatherModel)
    func didFailWithError(error: Error)
}
struct WeatherCity {
    var delegate:WeatherManagerDelegate?
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=f6ce6c8f34260d59dc97216fd711822d"
    
    func fithchCity (cityName : String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        request(whith: urlString)
    }
    func request(whith urlString : String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
self.delegate?.didFailWithError(error: error!)
        return
                }
                if let safeDate = data {
    //if let dataString = self.parseJson(weatherData: safeDate){
                    if let weather = self.parseJson(ـ: safeDate){
            self.delegate?.didUpdateWeather(self, weather: weather)
        }
                }
            }
            task.resume()
        }
            
    }
    func parseJson(ـ weatherData:Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decoderData.weather[0].id
            let temp = decoderData.main.temp
            let name = decoderData.name
            let weather = WeatherModel(conditinID: id, cityName: name, temperater: temp)
            
            return weather
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }

}
