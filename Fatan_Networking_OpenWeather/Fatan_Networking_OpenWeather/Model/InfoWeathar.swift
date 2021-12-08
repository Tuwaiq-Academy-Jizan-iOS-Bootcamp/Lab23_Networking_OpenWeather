//
//  InfoWeathar.swift
//  Fatan_Networking_OpenWeather
//
//  Created by Faten Abdullh salem on 03/05/1443 AH.
//

import Foundation
struct InfoWeathar: Codable {
let coord:Coord
let weather:[Weather]
let base:String
let main:Main
let visibility:Int
let wind:Wind
let clouds:Clouds
let dt:Int
let sys:Sys
let timezone:Int
let id:Int
let name:String
let cod:Int
    
}
 
struct Coord {
let lon:Double
let lat:Double
}
struct Weather:Codable {
let id:Int
let main:String
let descropion:String
let incon:String
}

struct Main:Codable {
let temp:Double
let feels_like:Double
let temp_mai:Double
let temp_max:Double
let pressure:Int
let humidity:Int
let sea_level:Int
let grnd_level:Int
}

struct Wind:Codable {
let speed:Double
let deg:Int
let gust:Double
}
struct Clouds:Codable {
    let all:Int
}
struct Sys:Codable {
let country:String
let sunrise:Int
let sunset:Int
}
import Foundation
struct InfoWeathar: Codable {
let coord:Coord
let weather:[Weather]
let base:String
let main:Main
let visibility:Int
let wind:Wind
let clouds:Clouds
let dt:Int
let sys:Sys
let timezone:Int
let id:Int
let name:String
let cod:Int
    
}
 
struct Coord {
let lon:Double
let lat:Double
}
struct Weather:Codable {
let id:Int
let main:String
let descropion:String
let incon:String
}

struct Main:Codable {
let temp:Double
let feels_like:Double
let temp_mai:Double
let temp_max:Double
let pressure:Int
let humidity:Int
let sea_level:Int
let grnd_level:Int
}

struct Wind:Codable {
let speed:Double
let deg:Int
let gust:Double
}
struct Clouds:Codable {
    let all:Int
}
struct Sys:Codable {
let country:String
let sunrise:Int
let sunset:Int
}
