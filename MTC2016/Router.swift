//
//  Router.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import Foundation
import City
import Weather
import Common

class Router {
  
  let cityModule = CityModule()
  
  init() {
    cityModule.delegate = self
  }
  
  var rootViewController: UIViewController {
    return cityModule.viewController
  }
}

extension Router: CityModuleDelegate {
  
  func cityModule(module: CityModule, didSelectCity city: City) {
    let weatherModule = WeatherModule(city: city)
    rootViewController.navigationController?.pushViewController(weatherModule.viewController, animated: true)
  }
}
