//
//  DetailManager.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 17/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import Foundation

protocol DetailManagerDelegate {
    func didUpdateWeather(_ weatherManager: DetailManager, weather: DetailModel)
    func didFailWithError(error: Error)
}

struct DetailManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=94.037689&%20exclude=hourly,minutely&appid=c585fedb415f1d87b3987794305788c2&Lagos"
    
    var delegate: DetailManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = weatherURL
        performRequest(with: urlString)
        
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let detailWeather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: detailWeather)
                        
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
            let id = decodedData.current.weather[0].id
            let temp = decodedData.current.temp
            let current = decodedData.current
            let minute = decodedData.minutely
            let hourly = decodedData.hourly
            let daily = decodedData.daily
            
            let detailModel = DetailModel(conditonId: id, current: current, minutely:minute, hourly: hourly, daily:daily)
            
            
            return detailModel
    
            
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
