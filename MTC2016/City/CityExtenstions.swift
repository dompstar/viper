//
//  CityExtenstions.swift
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
  static func bundleForCityModule() -> NSBundle {
    return NSBundle(forClass: CityModule.self)
  }
}

// MARK: - UIStoryboard
internal extension UIStoryboard {
  convenience init(nameInCityModule: String) {
    self.init(name: nameInCityModule, bundle: NSBundle.bundleForCityModule())
  }
}

// MARK: - UIImage
internal extension UIImage {
  convenience init?(namedInCityModule: String) {
    self.init(named: namedInCityModule, inBundle: NSBundle.bundleForCityModule(), compatibleWithTraitCollection: nil)
  }
}
