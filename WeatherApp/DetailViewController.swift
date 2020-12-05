//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 16/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,DetailManagerDelegate {
    
    
    
    @IBOutlet weak var container: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet var degreeLabel: [UILabel]!
    @IBOutlet var cloudLabel: [UIButton]!
    
    var dateFormat = DateFormatter()
    var detailManager = DetailManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailManager.delegate = self
        container.layer.cornerRadius = 20
        dateFormat.dateFormat = "MM, dd, yyy"
        dateLabel.text = dateFormat.string(from: Date())
         detailManager.fetchWeather(cityName: "Lagos")
        
        

      }
    
    func didUpdateDetailWeather(_ weatherManager: DetailManager, detailModel: DetailModel) {
        DispatchQueue.main.async {
            
        }
    }
    
    func didUpdateDetailWeather( detailWeather : DetailModel) {
        print(detailWeather.temperature)
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
