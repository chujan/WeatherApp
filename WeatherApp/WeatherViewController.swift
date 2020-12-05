//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 12/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherMangerDelegate {
    
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var forcast: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humLabel: UILabel!
    
    var weatherManager = WeatherManager()
    var dateFormat = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormat.dateFormat = "MM, dd, yyy"
        dateLabel.text = dateFormat.string(from: Date())
        
        weatherManager.delegate = self
        weatherManager.fetchWeather(cityName: "Lagos")

        container.layer.cornerRadius = 20
        forcast.layer.cornerRadius = 20

    }
    
    func didUpdateWeather(_ weatherManager:WeatherManager,weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.dateLabel.text = self.dateFormat.string(from: Date())
            self.humLabel.text = String(weather.humidity) + "%"
            self.windLabel.text = String(weather.speed) + "km/h"
            self.cloudLabel.text = weather.conditionName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
