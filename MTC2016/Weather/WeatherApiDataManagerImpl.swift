//
//  WeatherApiDataManagerImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation

class WeatherApiDataManagerImpl: WeatherApiDataManager {

  // WeatherApiDataManager
  weak var interactor: WeatherApiDataManagerOutput?
  var weatherApi: WeatherApi = WorldWeatherOnlineApi()
}

// MARK: - WeatherApiDataManagerInput
extension WeatherApiDataManagerImpl: WeatherApiDataManagerInput {
  func loadWeatherDataForQuery(query: String) {
    weatherApi.loadWeatherForQuery(query) { (weather, error) in
      if let error = error {
        self.interactor?.didFailLoadingWeatherData(error)
      } else {
        self.interactor?.didLoadWeatherData(weather)
      }
    }
  }
}
