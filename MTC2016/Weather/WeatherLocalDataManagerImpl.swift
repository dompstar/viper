//
//  WeatherLocalDataManagerImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation

class WeatherLocalDataManagerImpl: WeatherLocalDataManager {

  // WeatherLocalDataManager
  weak var interactor: WeatherLocalDataManagerOutput?
}

// MARK: - WeatherLocalDataManagerInput
extension WeatherLocalDataManagerImpl: WeatherLocalDataManagerInput {
}
