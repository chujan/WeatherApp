//
//  DetailManager.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 17/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import Foundation

protocol DetailManagerDelegate {
    func didUpdateDetailWeather(_ weatherManager: DetailManager, detailModel: DetailModel)
    func didFailWithError(error: Error)
}

struct DetailManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=94.037689&%20exclude=hourly,minutely&appid=c585fedb415f1d87b3987794305788c2&Lagos"
    
    var delegate: DetailManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&=\(cityName)"
        performRequest(urlString: urlString)
        
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let detailWeather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateDetailWeather(self, detailModel: detailWeather)
                    }

                }
            }
            
            task .resume()
        }
        
    }
    func parseJSON(_ detailData: Data) -> DetailModel?{
        
        let decoder = JSONDecoder()
        do {
         let decodedData = try decoder.decode(DetailData.self, from: detailData)
            let id = decodedData.current.detailWeather[0].id
            let temp = decodedData.current.temp
            let current = Current.self
            
            let detailWeather = DetailModel(conditonId: id, cityName: "Current", temperature: temp)
            return detailWeather
    
            
            
        } catch {
            print(error)
            return nil
        }
    }
    
}
