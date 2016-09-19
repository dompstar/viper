//
//  WeatherStrings.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//


import Foundation

struct WeatherStrings {

  private static let bundle = NSBundle.bundleForWeatherModule()

  static var moduleName: String {
    return NSLocalizedString("Weather.moduleName", bundle: bundle, value: "Weather", comment: "The name of the module")
  }

  /***** Format Example *****

   private static var format: String {
   return NSLocalizedString("Weather.format", bundle: bundle, value: "Format %@ (%d)", comment: "Format example")
   }
   static func format(name name: String, age: Int) -> String {
   return String(format: WeatherStrings.format, name, age)
   }

   */
}
