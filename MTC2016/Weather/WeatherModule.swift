//
//  WeatherModule.swift
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

public class WeatherModule {

  // MARK: - Public interface
  public private(set) weak var viewController: UIViewController!
  public weak var delegate: WeatherModuleDelegate?

  private weak var moduleOutput: WeatherModuleOutput?

  public init(city: City) {
    setup()
    moduleOutput?.useCity(city)
  }
}

// MARK: - WeatherModuleInput
extension WeatherModule: WeatherModuleInput {
}



// MARK: - Setup
extension WeatherModule {

  private func setup() {
    // swiftlint:disable force_cast

//    let viewControllerImpl = UIStoryboard(nameInWeatherModule: "Weather").instantiateInitialViewController() as! WeatherSimpleViewController
    let viewControllerImpl = UIStoryboard(nameInWeatherModule: "Weather").instantiateInitialViewController() as! WeatherViewController
    
    let presenterImpl = WeatherPresenterImpl()
    let interactorImpl = WeatherInteractorImpl()
    let apiDataManagerImpl = WeatherApiDataManagerImpl()
    let localDataManagerImpl = WeatherLocalDataManagerImpl()

    moduleOutput = presenterImpl
    viewController = viewControllerImpl

    viewControllerImpl.presenter = presenterImpl

    presenterImpl.interactor = interactorImpl
    presenterImpl.userInterface = viewControllerImpl
    presenterImpl.module = self

    interactorImpl.presenter = presenterImpl
    interactorImpl.apiDataManager = apiDataManagerImpl
    interactorImpl.localDataManager = localDataManagerImpl

    apiDataManagerImpl.interactor = interactorImpl
    localDataManagerImpl.interactor = interactorImpl
  }
}
