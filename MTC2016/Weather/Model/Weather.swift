//
//  Weather.swift
//  MTC2016
//
//  Created by Jonas Stubenrauch on 10.03.16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import Foundation

struct Weather {

  let forecasts: [Forecast]
  var currentWeatherDescription: String?
  var currentWeatherTemp: String?

  init(weatherData: [String: AnyObject]) {
    if let forecastsData = weatherData["weather"] as? [[ String: AnyObject]] {
      forecasts = forecastsData.map { Forecast(forecastData: $0) }
    } else {
      forecasts = []
    }

    if let current = weatherData["current_condition"]?.firstObject as? [String: AnyObject] {
      currentWeatherTemp = current["temp_C"] as? String

      if let desc = current["weatherDesc"]?.firstObject as? [String : AnyObject] {
        currentWeatherDescription = desc["value"] as? String
      }
    }
  }
}
