//
//  WeatherData.swift
//  ehab_Hakami_OpenWeather
//
//  Created by Ehab Hakami on 09/05/1443 AH.
//

import Foundation
struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
