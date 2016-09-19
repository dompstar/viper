//
//  WeatherProtocols.swift
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

// MARK: - WeatherModuleDelegate
public protocol WeatherModuleDelegate: class {
}

// MARK: - Classes
protocol WeatherUserInterface: class {
  var presenter: WeatherPresenterInput! { get set }
}

protocol WeatherPresenter: class {
  var module: WeatherModuleInput! { get set }
  var userInterface: WeatherPresenterOutput? { get set }
  var interactor: WeatherInteractorInput! { get set }
}

protocol WeatherInteractor: class {
  var presenter: WeatherInteractorOutput? { get set }
  var apiDataManager: WeatherApiDataManagerInput! { get set }
  var localDataManager: WeatherLocalDataManagerInput! { get set }
}

protocol WeatherLocalDataManager: class {
  var interactor: WeatherLocalDataManagerOutput? { get set }
}

protocol WeatherApiDataManager: class {
  var interactor: WeatherApiDataManagerOutput? { get set }
  var weatherApi: WeatherApi { get set }
}

// MARK: - Presenter -> Module
protocol WeatherModuleInput: class {
}

// MARK: - Module -> Presenter
protocol WeatherModuleOutput: class {
  func useCity(city: City)
}

// MARK: - UserInterface -> Presenter
protocol WeatherPresenterInput: class {
  func userInterfaceReady()
}

// MARK: - Presenter -> UserInterface
protocol WeatherPresenterOutput: class {
  func showCityName(cityName: String)

  func showLoading()

  func showForecasts(forecasts: [String])
  func showCurrentWeather(weather: String)

  func showError(error: String)
  func showNoResults()
}

// MARK: - Presenter -> Interactor
protocol WeatherInteractorInput: class {
  func updateWeatherForCity(city: City)
}

// MARK: - Interactor -> Presenter
protocol WeatherInteractorOutput: class {
  func didUpdateWeather(weather: Weather)
  func didNotFoundWeather()
  func didFailUpdatingWeather(error: ErrorType?)
}

// MARK: - Interactor -> ApiDataManager
protocol WeatherApiDataManagerInput : class {
  func loadWeatherDataForQuery(query: String)
}

// MARK: - ApiDataManager -> Interactor
protocol WeatherApiDataManagerOutput: class {
  func didLoadWeatherData(weather: Weather?)
  func didFailLoadingWeatherData(error: ErrorType)
}

// MARK: - Interactor -> LocalDataManager
protocol WeatherLocalDataManagerInput: class {
}

// MARK: - LocalDataManager -> Interactor
protocol WeatherLocalDataManagerOutput: class {
}
