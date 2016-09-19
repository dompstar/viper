//
//  WeatherExtenstions.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//
//  VIPER Template by arconsis.com
//


import Foundation
import UIKit

// MARK: - NSBundle
internal extension NSBundle {
  static func bundleForWeatherModule() -> NSBundle {
    return NSBundle(forClass: WeatherModule.self)
  }
}

// MARK: - UIStoryboard
internal extension UIStoryboard {
  convenience init(nameInWeatherModule: String) {
    self.init(name: nameInWeatherModule, bundle: NSBundle.bundleForWeatherModule())
  }
}

// MARK: - UIImage
internal extension UIImage {
  convenience init?(namedInWeatherModule: String) {
    self.init(named: namedInWeatherModule, inBundle: NSBundle.bundleForWeatherModule(), compatibleWithTraitCollection: nil)
  }
}
