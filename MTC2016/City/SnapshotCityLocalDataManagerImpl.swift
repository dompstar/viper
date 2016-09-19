//
//  CityLocalDataManagerImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation
import Common
import CoreData

class SnapshotCityLocalDataManagerImpl: CityLocalDataManager {

  // CityLocalDataManager
  weak var interactor: CityLocalDataManagerOutput?
  var coreDataStack = CoreDataStack()
  var cities: [City]

  init() {
    cities = [City(name: "Karlsruhe"), City(name: "Berlin")]
  }
}

// MARK: - CityLocalDataManagerInput
extension SnapshotCityLocalDataManagerImpl: CityLocalDataManagerInput {

  func saveCity(city: City) {
    cities.append(city)
    interactor?.didSaveCity()
  }

  func removeCityAtIndex(index: Int) {
    cities.removeAtIndex(index)
    interactor?.didSaveCity()
  }

  func cityAtIndex(index: Int) -> City? {
    return cities[index]
  }

  func countOfCities() -> Int {
    return cities.count ?? 0
  }
}
