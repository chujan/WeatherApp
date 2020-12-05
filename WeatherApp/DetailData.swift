//
//  DetailData.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 21/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import Foundation

struct DetailData: Codable {
    let current: Current

}

struct Current: Codable {
    let temp: Double
    let detailWeather: [DetailWeather]
    
    private enum CodingKeys: String, CodingKey {
        case detailWeather = "weather"
        case temp
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        temp = try container.decode(Double.self, forKey:.temp)
        detailWeather = try container.decode([DetailWeather].self, forKey:.detailWeather)
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container  = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(temp, forKey: .temp)
        try container.encode(detailWeather,forKey: .detailWeather)
    }
}

struct DetailWeather: Codable {
    let description: String
    let id: Int
}


