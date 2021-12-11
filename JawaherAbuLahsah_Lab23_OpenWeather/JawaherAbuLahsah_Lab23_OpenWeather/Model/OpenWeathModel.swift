//
//  OpenWeathModel.swift
//  JawaherAbuLahsah_Lab23_OpenWeather
//
//  Created by Jawaher Mohammad on 21/04/1443 AH.
//

import Foundation
struct OpenWeath: Codable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: Main
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
