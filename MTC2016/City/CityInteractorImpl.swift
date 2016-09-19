//
//  CityInteractorImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//

import Foundation
import Common

class CityInteractorImpl: CityInteractor {

  // CityInteractor
  var apiDataManager: CityApiDataManagerInput!
  var localDataManager: CityLocalDataManagerInput!
  weak var presenter: CityInteractorOutput?
}

// MARK: - CityInteractorInput
extension CityInteractorImpl: CityInteractorInput {

  func addCity(city: City) {
    localDataManager.saveCity(city)
  }

  func removeCityAtIndex(index: Int) {
    localDataManager.removeCityAtIndex(index)
  }

  func countOfCities() -> Int {
    return localDataManager.countOfCities()
  }

  func cityAtIndex(index: Int) -> City? {
    return localDataManager.cityAtIndex(index)
  }
}

// MARK: - CityLocalDataManagerOutput
extension CityInteractorImpl: CityLocalDataManagerOutput {

  func didSaveCity() {
    presenter?.didUpdateCities()
  }

  func didFailSavingCity(error: ErrorType?) {
    presenter?.didFailAddingCity(error)
  }

  func didRemoveCity() {
    presenter?.didUpdateCities()
  }

  func didFailRemovingCity(error: ErrorType?) {
    presenter?.didFailRemovingCity(error)
  }
}

// MARK: - CityApiDataManagerOutput
extension CityInteractorImpl: CityApiDataManagerOutput {

}
