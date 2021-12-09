//
//  Mycity.swift
//  DoaaAlageel_lab23_Weather
//
//  Created by Dua'a ageel on 05/05/1443 AH.
//

import Foundation

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
