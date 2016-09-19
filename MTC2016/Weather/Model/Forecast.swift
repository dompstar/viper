//
//  Forecast.swift
//  MTC2016
//
//  Created by Jonas Stubenrauch on 10.03.16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import Foundation

struct Forecast {
  
  let date: String
  let minTemp: String
  let maxTemp: String
  
  init(forecastData: [String: AnyObject]) {
    date = forecastData["date"] as? String ?? ""
    minTemp = forecastData["mintempC"] as? String ?? ""
    maxTemp = forecastData["maxtempC"] as? String ?? ""
  }
}