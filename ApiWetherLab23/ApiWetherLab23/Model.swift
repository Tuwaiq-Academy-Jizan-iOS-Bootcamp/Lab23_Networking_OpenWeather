//
//  Model.swift
//  ApiWetherLab23
//
//  Created by layla hakami on 23/04/1443 AH.
//

import Foundation
import UIKit
struct Waether{
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?q=abha&appid=546238aac25a2bd132a6a481e8767ba0&units=metric"
}

func performRequest(urlString: String){
    if let url = URL(string:urlString){
        
        
        let session = URLSession(configuration: .default)
        
let task = session.dataTask(with: url) { (data, response, error) in
    if error != nil {
        print("error")
        
        return
    }
    if let safeData = data{
        self.parseJSON(WaetherData:safeData)
//    let dataString = String(data:safeData,encoding: .utf8)
        
    }
        }
        task.resume()
    }
        
        
        
        
    
}
