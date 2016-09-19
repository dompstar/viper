//
//  WeatherInteractorImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation
import Common

class WeatherInteractorImpl: WeatherInteractor {

  // WeatherInteractor
  var apiDataManager: WeatherApiDataManagerInput!
  var localDataManager: WeatherLocalDataManagerInput!
  weak var presenter: WeatherInteractorOutput?
}

// MARK: - WeatherLocalDataManagerOutput
extension WeatherInteractorImpl: WeatherLocalDataManagerOutput {
}


// MARK: - WeatherInteractorInput
extension WeatherInteractorImpl: WeatherInteractorInput {
  func updateWeatherForCity(city: City) {
    apiDataManager.loadWeatherDataForQuery(city.name)
  }
}


// MARK: - WeatherApiDataManagerOutput
extension WeatherInteractorImpl: WeatherApiDataManagerOutput {
  func didLoadWeatherData(weather: Weather?) {
    if let weather = weather where weather.currentWeatherDescription != nil || weather.forecasts.count > 0 {
      presenter?.didUpdateWeather(weather)
    } else {
      presenter?.didNotFoundWeather()
    }
  }

  func didFailLoadingWeatherData(error: ErrorType) {
    presenter?.didFailUpdatingWeather(error)
  }
}
