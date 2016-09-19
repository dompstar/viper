//
//  CityPresenterImpl.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//


import Foundation
import Common

class CityPresenterImpl: CityPresenter {

  // CityPresenter
  weak var userInterface: CityPresenterOutput?
  var interactor: CityInteractorInput!
  var module: CityModuleInput!
}


// MARK: - CityPresenterInput
extension CityPresenterImpl: CityPresenterInput {

  func userInterfaceReady() {
    userInterface?.refreshView()
  }
  
  func handleAddCityActionWithName(name: String) {
    
    let city = City(name: name)
    interactor.addCity(city)
  }
  
  func handleRemoveCityAtIndex(index: Int) {
    interactor.removeCityAtIndex(index)
  }
  
  func handleCitySelectionAtIndex(index: Int) {
    if let city = interactor.cityAtIndex(index) {
      module.didSelectCity(city)
    }
  }
  
  func cityNameAtIndex(index: Int) -> String? {
    let city = interactor.cityAtIndex(index)
    return city?.name
  }
  
  func countOfCities() -> Int {
    return interactor.countOfCities()
  }
}


// MARK: - CityInteractorOutput
extension CityPresenterImpl: CityInteractorOutput {
  
  func didUpdateCities() {
    userInterface?.refreshView()
  }
  
  func didFailAddingCity(error: ErrorType?) {
    userInterface?.showError("Could not add city")
  }
  
  func didFailRemovingCity(error: ErrorType?) {
    userInterface?.showError("Could not remove city")
  }
}


// MARK: - CityModuleOutput
extension CityPresenterImpl: CityModuleOutput {
}
