//
//  CityModule.swift
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

public class CityModule {

  // MARK: - Public interface
  public private(set) weak var viewController: UIViewController!
  public weak var delegate: CityModuleDelegate?

  private weak var moduleOutput: CityModuleOutput?

  public init() {
    setup()
  }
}

// MARK: - CityModuleInput
extension CityModule: CityModuleInput {

  func didSelectCity(city: City) {
    delegate?.cityModule(self, didSelectCity: city)
  }
}



// MARK: - Setup
extension CityModule {

  private func setup() {
    // swiftlint:disable force_cast
    let viewControllerImpl = UIStoryboard(nameInCityModule: "City").instantiateInitialViewController() as! CityViewController
    let presenterImpl = CityPresenterImpl()
    let interactorImpl = CityInteractorImpl()
    let apiDataManagerImpl = CityApiDataManagerImpl()
//    let localDataManagerImpl = SnapshotCityLocalDataManagerImpl()
//    let localDataManagerImpl = CityLocalDataManagerImpl()
    let localDataManagerImpl = CityRealmLocalDataManagerImpl()


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
