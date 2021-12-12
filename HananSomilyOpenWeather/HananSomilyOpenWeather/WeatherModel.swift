//
//  WeatherModel.swift
//  HananSomilyOpenWeather
//
//  Created by Hanan Somily on 27/11/2021.
//

import Foundation
struct WeatherModel{
    var conditinID:Int
    var cityName:String
    var temperater:Double
    
    var coditionals:String{
                switch conditinID {
                case 200...232:
                    return "cloud.bolt"
                case 300...321:
                    return "cloud.drizzle"
                case 500...531:
                    return "cloud.rain"
                case 600...622:
                    return "cloud.snow"
                case 701...781:
                    return "cloud.fog"
                case 800:
                    return "sun.max"
                case 801...804:
                    return "cloud.bolt"
                default:
                         return "cloud"
                    }
    }
        var temperaterString:String{
            return String(format: "%.1f",temperater )
        }
    }

    

