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

class WeatherViewController: UITableViewController, WeatherUserInterface {

  // WeatherUserInterface
  var presenter: WeatherPresenterInput!

  var currentWeather = "" {
    didSet {
      tableView.reloadData()
    }
  }

  var forecasts = [String]() {
    didSet {
      tableView.reloadData()
    }
  }

  // MARK: - ViewController lifecycle
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    presenter.userInterfaceReady()
  }
}

// MARK: - UITableViewDataSource
extension WeatherViewController {
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    switch section {
    case 0:
      return "Current Condition"
    case 1:
      return "Forecast"
    default:
      return ""
    }
  }

  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }

  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 1 ? forecasts.count : 1
  }

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    if indexPath.section == 1 {
      cell.textLabel?.text = forecasts[indexPath.row]
    } else {
      cell.textLabel?.text = currentWeather
    }
    return cell
  }
}


// MARK: - WeatherPresenterOutput
extension WeatherViewController: WeatherPresenterOutput {
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
