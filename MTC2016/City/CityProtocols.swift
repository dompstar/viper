//
//  CityProtocols.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//


import Foundation
import UIKit
import Common

// MARK: - CityModuleDelegate
public protocol CityModuleDelegate: class {
  
  func cityModule(module: CityModule, didSelectCity city: City)
}

// MARK: - Classes
protocol CityUserInterface: class {
  var presenter: CityPresenterInput! { get set }
}

protocol CityPresenter: class {
  var module: CityModuleInput! { get set }
  var userInterface: CityPresenterOutput? { get set }
  var interactor: CityInteractorInput! { get set }
}

protocol CityInteractor: class {
  var presenter: CityInteractorOutput? { get set }
  var apiDataManager: CityApiDataManagerInput! { get set }
  var localDataManager: CityLocalDataManagerInput! { get set }
}

protocol CityLocalDataManager: class {
  var interactor: CityLocalDataManagerOutput? { get set }
}

protocol CityApiDataManager: class {
  var interactor: CityApiDataManagerOutput? { get set }
}

// MARK: - Presenter -> Module
protocol CityModuleInput: class {
  func didSelectCity(city: City)
}

// MARK: - Module -> Presenter
protocol CityModuleOutput: class {
}

// MARK: - UserInterface -> Presenter
protocol CityPresenterInput: class {
  func userInterfaceReady()
  func handleAddCityActionWithName(name: String)
  func handleRemoveCityAtIndex(index: Int)
  func handleCitySelectionAtIndex(index: Int)
  func cityNameAtIndex(index: Int) -> String?
  func countOfCities() -> Int
}

// MARK: - Presenter -> UserInterface
protocol CityPresenterOutput: class {
  func showError(errorText: String)
  func refreshView()
}

// MARK: - Presenter -> Interactor
protocol CityInteractorInput: class {
  func addCity(city: City)
  func removeCityAtIndex(index: Int)
  func cityAtIndex(index: Int) -> City?
  func countOfCities() -> Int
}

// MARK: - Interactor -> Presenter
protocol CityInteractorOutput: class {
  func didUpdateCities()
  func didFailAddingCity(error: ErrorType?)
  func didFailRemovingCity(error: ErrorType?)
}

// MARK: - Interactor -> ApiDataManager
protocol CityApiDataManagerInput : class {
}

// MARK: - ApiDataManager -> Interactor
protocol CityApiDataManagerOutput: class {
}

// MARK: - Interactor -> LocalDataManager
protocol CityLocalDataManagerInput: class {
  func saveCity(city: City)
  func removeCityAtIndex(index: Int)
  func countOfCities() -> Int
  func cityAtIndex(index: Int) -> City?
}

// MARK: - LocalDataManager -> Interactor
protocol CityLocalDataManagerOutput: class {
  func didSaveCity()
  func didFailSavingCity(error: ErrorType?)
  func didRemoveCity()
  func didFailRemovingCity(error: ErrorType?)
}
