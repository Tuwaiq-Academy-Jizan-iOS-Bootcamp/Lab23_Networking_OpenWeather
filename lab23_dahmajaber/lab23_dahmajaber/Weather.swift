//
//  Weather.swift
//  lab23_dahmajaber
//
//  Created by dahma alwani on 30/04/1443 AH.
//

import Foundation

struct Mycity:Codable{
   var main : Main
   var weather: [Weather]
    
}

struct Main:Codable{
   var temp : Double
}
struct Weather:Codable{

   var description : String
  

}
