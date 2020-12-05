//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 12/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import Foundation

protocol WeatherMangerDelegate {
    func didUpdateWeather(_ weatherManager:WeatherManager,weather:WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8e9d01a3c06523288afc917659a99648&units=metric&q=Lagos"

    var delegate: WeatherMangerDelegate?
    
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
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
                        if let weather = self.parseJSON(weatherData: safeData) {
                            self.delegate?.didUpdateWeather(self, weather: weather)
                        }
                
                       }
        
            }
            task.resume()
            
        }
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
           let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = (decodedData.weather[0].id)
            let temp = decodedData.main.temp
            let name = decodedData.name
            let humidity = decodedData.main.humidity
            let speed = decodedData.wind.speed
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, humidity: humidity, speed: speed)
             
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            print(error)
            return nil
        }
        
    }
    
    

    
   
    }
    
    

