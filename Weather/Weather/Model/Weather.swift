//
//  Weather.swift
//  Weather
//
//  Created by Afrah Omar on 29/04/1443 AH.
//

import Foundation
struct InfoWeathar:Codable{
   var main : Main
   var weather: [Weather]
    
}

struct Main:Codable{
   var temp : Double
}
struct Weather:Codable{

   var description : String
}
