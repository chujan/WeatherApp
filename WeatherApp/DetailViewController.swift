//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 16/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITextFieldDelegate,DetailManagerDelegate {
    
    
    
    @IBOutlet weak var container: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet var degreeLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var tempretureLabel2: UILabel!
    @IBOutlet weak var dateLabel2: UILabel!
    @IBOutlet weak var dateLabel3: UILabel!
    @IBOutlet weak var dateLabel4: UILabel!
    @IBOutlet weak var dateLabel5: UILabel!
    @IBOutlet weak var dateLabel6: UILabel!
    @IBOutlet weak var tempretureLabel3: UILabel!
    @IBOutlet weak var tempretureLabel4: UILabel!
    @IBOutlet weak var tempretureLabel5: UILabel!
    @IBOutlet weak var degreeLabel2: UILabel!
    @IBOutlet weak var degreeLabel4: UILabel!
    @IBOutlet weak var degreeLabel3: UILabel!
    @IBOutlet weak var degreeLabel5: UILabel!
    @IBOutlet weak var conditionImage2: UIImageView!  
    @IBOutlet weak var conditionImage3: UIImageView!
    @IBOutlet weak var conditionImage4: UIImageView!
    @IBOutlet weak var conditionImage5: UIImageView!
    @IBOutlet weak var conditionImage6: UIImageView!
    @IBOutlet weak var conditionImage7: UIImageView!
    @IBOutlet weak var conditionImage8: UIImageView!
    @IBOutlet weak var conditionImage9: UIImageView!
    @IBOutlet weak var conditionImage10: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    @IBOutlet weak var timeLabel3: UILabel!
    @IBOutlet weak var timeLabel4: UILabel!
    @IBOutlet weak var timeLabel5: UILabel!
    
    var dateFormat = DateFormatter()
    var detailManager = DetailManager()
    var currentDate = Date()
    var mf = MeasurementFormatter()

    


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailManager.delegate = self
        container.layer.cornerRadius = 20
        dateFormat.dateFormat = "MM, dd, yyy"
        dateLabel.text = dateFormat.string(from: Date())
        detailManager.fetchWeather(cityName: "Lagos")
        
        
        
        
    }
    
    
    func didUpdateWeather(_ weatherManager: DetailManager, weather: DetailModel) {
        
        DispatchQueue.main.async { [self] in
            self.tempretureLabel.text = self.convertTemp(temp: weather.current.temp, from: .kelvin, to: .celsius)
            self.tempretureLabel2.text = self.convertTemp(temp: weather.hourly[1].temp, from: .kelvin, to: .celsius)
            self.tempretureLabel3.text = self.convertTemp(temp: weather.hourly[2].temp, from: .kelvin, to: .celsius)
            self.tempretureLabel4.text = self.convertTemp(temp: weather.hourly[3].temp, from: .kelvin, to: .celsius)
            self.tempretureLabel5.text = self.convertTemp(temp: weather.hourly[4].temp, from: .kelvin, to: .celsius)
            self.degreeLabel.text = self.convertTemp(temp: weather.daily[0].temp.day, from: .kelvin, to: .celsius)
            self.degreeLabel2.text = self.convertTemp(temp: weather.daily[1].temp.day, from: .kelvin, to: .celsius)
            self.degreeLabel3.text = self.convertTemp(temp: weather.daily[2].temp.day, from: .kelvin, to: .celsius)
            self.degreeLabel4.text = self.convertTemp(temp: weather.daily[3].temp.day, from: .kelvin, to: .celsius)
            self.degreeLabel5.text = self.convertTemp(temp: weather.daily[4].temp.day, from: .kelvin, to: .celsius)
            self.conditionImage.image = weather.getConditionName(conditionId: weather.conditonId)
            self.conditionImage2.image = weather.getConditionName(conditionId: weather.hourly[1].weather[0].id)
            self.conditionImage3.image = weather.getConditionName(conditionId: weather.hourly[2].weather[0].id)
            self.conditionImage4.image = weather.getConditionName(conditionId: weather.hourly[3].weather[0].id)
            self.conditionImage5.image =  weather.getConditionName(conditionId: weather.hourly[4].weather[0].id)
            self.conditionImage6.image = weather.getConditionName(conditionId: weather.daily[1].weather[0].id)
            self.conditionImage7.image = weather.getConditionName(conditionId: weather.daily[2].weather[0].id)
            self.conditionImage8.image = weather.getConditionName(conditionId: weather.daily[3].weather[0].id)
            self.conditionImage9.image = weather.getConditionName(conditionId: weather.daily[4].weather[0].id)
            self.conditionImage10.image = weather.getConditionName(conditionId: weather.daily[5].weather[0].id)
            self.timeLabel.text = self.convertTime(timeValue: weather.hourly[0].dt)
            self.timeLabel2.text = self.convertTime(timeValue: weather.hourly[1].dt)
            self.timeLabel3.text = self.convertTime(timeValue: weather.hourly[2].dt)
            self.timeLabel4.text = self.convertTime(timeValue: weather.hourly[3].dt)
            self.timeLabel5.text = self.convertTime(timeValue: weather.hourly[4].dt)
            self.dateLabel2.text = self.convertDate(dateValue: weather.daily[1].dt)
            self.dateLabel3.text = self.convertDate(dateValue: weather.daily[2].dt)
            self.dateLabel4.text = self.convertDate(dateValue: weather.daily[3].dt)
            self.dateLabel5.text = self.convertDate(dateValue: weather.daily[4].dt)
            self.dateLabel6.text = self.convertDate(dateValue: weather.daily[5].dt)
            let temperature = 268.11
            let Celsius = convertTemp(temp: temperature, from: .kelvin, to: .celsius)
            
            
        }
        
    }
    
    
    func convertDate(dateValue: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(dateValue))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_NG")
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    
    func convertTemp(temp: Double,from Kelvin: UnitTemperature,to Celsius: UnitTemperature) -> String {
        mf.numberFormatter.maximumFractionDigits = 0
        let Kelvin = Measurement(value: temp, unit: Kelvin)
        let Celsius = Kelvin.converted(to: Celsius)
        return mf.string(from: Celsius)
        
    }
    
    func convertTime(timeValue: Int) -> String {
        let date = NSDate(timeIntervalSince1970: Double(timeValue))
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm"
        return dayTimePeriodFormatter.string(from: date as Date)
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
    
}
