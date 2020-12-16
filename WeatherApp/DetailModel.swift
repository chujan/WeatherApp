//
//  DetailModel.swift
//  WeatherApp
//
//  Created by Chukwuemeka Jennifer on 23/09/2020.
//  Copyright © 2020 Chukwuemeka Jennifer. All rights reserved.
//

import Foundation
import UIKit

struct DetailModel {
    let conditonId: Int
    let current: Current
    let minutely: [Minutely]
    let hourly: [Current]
    let daily: [Daily]
    
    
    func temperture(tempretureString: Double) -> String {
        return String(format: "%.1f", tempretureString)
    }
    
        func getConditionName(conditionId: Int) -> UIImage {
        switch conditonId {
          case  200...232:
              return #imageLiteral(resourceName: "Vector 8")
          case 300...321:
              return #imageLiteral(resourceName: "Group 679")
          case 500...531:
              return #imageLiteral(resourceName: "Group 650")
          case 600...622:
              return #imageLiteral(resourceName: "Union")
          case 701...781:
              return #imageLiteral(resourceName: "sunny")
          case 800:
              return #imageLiteral(resourceName: "Group 679")
          case 801...804:
              return #imageLiteral(resourceName: "Vector 7")
          default:
           return #imageLiteral(resourceName: "Union")
          }
    }
}
