//
//  viewcontrollerstruct.swift
//  LAB 23
//
//  Created by زهور حسين on 05/05/1443 AH.
//

import Foundation
struct Weatherinfo: Codable {
    var name: String
    var main: Main
    var weather: [Weather]
}
struct Main: Codable {
    var temp: Double
}
struct Weather: Codable {
    var id: Int
    var description: String
}
