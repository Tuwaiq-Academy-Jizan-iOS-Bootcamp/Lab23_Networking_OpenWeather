//
//  Weather.swift
//  Afaf-Alqahtani-Lab23
//
//  Created by Afaf Yahya on 03/05/1443 AH.
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
