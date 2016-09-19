//
//  WeatherPresenterImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//


import Foundation
import Common

class WeatherPresenterImpl: WeatherPresenter {

  // WeatherPresenter
  weak var userInterface: WeatherPresenterOutput?
  var interactor: WeatherInteractorInput!
  var module: WeatherModuleInput!
  var city: City!
}


// MARK: - WeatherPresenterInput
extension WeatherPresenterImpl: WeatherPresenterInput {

  func userInterfaceReady() {
    userInterface?.showCityName(city.name)
    userInterface?.showLoading();
    interactor.updateWeatherForCity(city)
  }
}


// MARK: - WeatherInteractorOutput
extension WeatherPresenterImpl: WeatherInteractorOutput {
  func didNotFoundWeather() {
    userInterface?.showNoResults()
  }

  func didUpdateWeather(weather: Weather) {
    if let desc = weather.currentWeatherDescription, temp = weather.currentWeatherTemp {
      userInterface?.showCurrentWeather("\(desc), \(temp)°C")
    }
    
    let forecasts = weather.forecasts.map { forecast in
      return "\(forecast.date): min \(forecast.minTemp)°C, max \(forecast.maxTemp)°C"
    }
    userInterface?.showForecasts(forecasts)
  }

  func didFailUpdatingWeather(error: ErrorType?) {
    userInterface?.showError("Error loading Weather")
  }
}


// MARK: - WeatherModuleOutput
extension WeatherPresenterImpl: WeatherModuleOutput {
  
  func useCity(city: City) {
    self.city = city
  }
}
