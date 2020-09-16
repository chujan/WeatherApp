//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 14/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
    
    
}

struct Main: Codable {
    let temp: Double
    let humidity: Int

}

struct Weather: Codable {
    let description: String
    let id: Int
}

struct Wind: Codable {
    let speed: Double
    
}


