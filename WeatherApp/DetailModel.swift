//
//  DetailModel.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 23/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import Foundation

struct DetailModel {
    let conditonId: Int
    let cityName: String
    let temperature: Double
    
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
      switch conditonId {
        case  200...232:
            return "bolt"
        case 300...321:
            return "drizzle"
        case 500...531:
            return "rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "fog"
        case 800:
            return "max"
        case 801...804:
            return "bolt"
        default:
         return "cloud"
        }
    }
}
