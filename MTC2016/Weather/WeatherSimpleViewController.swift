//
//  WeatherViewController.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation
import UIKit

class WeatherSimpleViewController: UIViewController, WeatherUserInterface {

  // WeatherUserInterface
  var presenter: WeatherPresenterInput!

  @IBOutlet var currentWeatherLabel: UILabel!
  var currentWeather = "" {
    didSet {
      currentWeatherLabel.text = currentWeather
    }
  }

  @IBOutlet var forecastsLabel: UILabel!
  var forecasts = [String]() {
    didSet {
      forecastsLabel.text = forecasts.joinWithSeparator("\n")
    }
  }

  // MARK: - ViewController lifecycle
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    presenter.userInterfaceReady()
  }
}

// MARK: - WeatherPresenterOutput
extension WeatherSimpleViewController: WeatherPresenterOutput {
  func showCityName(cityName: String) {
    title = cityName
  }

  func showLoading() {
    currentWeather = "Loading"
    self.forecasts = []
  }

  func showForecasts(forecasts: [String]) {
    self.forecasts = forecasts
  }

  func showCurrentWeather(weather: String) {
    currentWeather = weather
  }

  func showError(error: String) {
    currentWeather = error
    self.forecasts = []
  }

  func showNoResults() {
    currentWeather = "No Data"
    self.forecasts = []
  }
}
