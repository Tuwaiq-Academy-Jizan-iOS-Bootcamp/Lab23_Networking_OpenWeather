//
//  WeatherModel.swift
//  JawaherAbuLahsah_Lab23_OpenWeather
//
//  Created by Jawaher Mohammad on 21/04/1443 AH.
//

import Foundation
struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}
