//
//  CityStrings.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//


import Foundation

struct CityStrings {

  private static let bundle = NSBundle.bundleForCityModule()

  static var moduleName: String {
    return NSLocalizedString("City.moduleName", bundle: bundle, value: "City", comment: "The name of the module")
  }

  static var errorAlertTitle: String {
    return NSLocalizedString("City.error.alert.title", bundle: bundle, value: "Error", comment: "The title of the error message")
  }

  static var errorAlertConfirmButtonTitle: String {
    return NSLocalizedString("City.error.alert.confirmButtonTitle", bundle: bundle, value: "OK", comment: "The title of the confirmation button")
  }

  static var addCityAlertTitle: String {
    return NSLocalizedString("City.addAlert.title", bundle: bundle, value: "New City", comment: "The title of add city alert")
  }

  static var addCityAlertMessage: String {
    return NSLocalizedString("City.addAlert.message", bundle: bundle, value: "Please enter a new city", comment: "The message of add city alert")
  }

  static var addCityAlertAddButtonTitle: String {
    return NSLocalizedString("City.addAlert.addButtonTitle", bundle: bundle, value: "Add", comment: "The title of add city button")
  }

  static var addCityAlertCancelButtonTitle: String {
    return NSLocalizedString("City.addAlert.cancelButtonTitle", bundle: bundle, value: "Cancel", comment: "The title of add city cancel button title")
  }
  /***** Format Example *****

   private static var format: String {
   return NSLocalizedString("City.format", bundle: bundle, value: "Format %@ (%d)", comment: "Format example")
   }
   static func format(name name: String, age: Int) -> String {
   return String(format: CityStrings.format, name, age)
   }

   */
}
