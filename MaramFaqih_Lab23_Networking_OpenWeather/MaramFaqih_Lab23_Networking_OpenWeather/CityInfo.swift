//
//  CityInfo.swift
//  MaramFaqih_Lab23_Networking_OpenWeather
//
//  Created by meme f on 23/04/1443 AH.
//

import Foundation
struct CityInfo:Codable{
   var main : Main
   var weather: [Weather]
    
}

struct Main:Codable{
   var temp : Double
}
struct Weather:Codable{
   var id: Int
   var main: String
   var description : String
   var icon: String

}
