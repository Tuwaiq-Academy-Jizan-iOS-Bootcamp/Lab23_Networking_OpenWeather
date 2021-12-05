//
//  WeatherStatus.swift
//  Bushra Barakat_Lab23
//
//  Created by Bushra Barakat on 28/04/1443 AH.
//

import Foundation
struct Clouds: Codable{
    var all: Int
}
struct Coord: Codable{
    var lon: Double
    var lat: Double
}
struct Wind: Codable{
    var speed: Double
    var deg: Int
    var gust: Double
}

struct Weather: Codable{
    var id: Int
    var main: String
    var description: String
    var icon: String
}
struct Sys: Codable{
    var country: String
    var sunrise: Int
    var sunset: Int
}
struct Main: Codable{
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Int
    var humidity: Int
    var sea_level: Int
    var grnd_level: Int
    
}

struct WeatherStatus :Codable{
    var coord : Coord
    var weather : [Weather]
    var base : String
    var main : Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
}


