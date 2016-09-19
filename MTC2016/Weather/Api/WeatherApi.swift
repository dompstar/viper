//
//  WeatherApi.swift
//  MTC2016
//
//  Created by Jonas Stubenrauch on 09.09.16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import Foundation

protocol WeatherApi {
  func loadWeatherForQuery(query: String, completion: (weather: Weather?, error: ErrorType?) -> Void)
}
