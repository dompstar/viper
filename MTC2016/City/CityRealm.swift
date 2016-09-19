//
//  CityRealm.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 09/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import Foundation
import RealmSwift
import Common

class CityRealm: Object {
  
  dynamic var id: String = ""
  dynamic var name: String = ""
  
  override static func primaryKey() -> String? {
    return "id"
  }
  
  convenience init(city: City) {
    self.init()
    updateWithCity(city)
  }
  
  private func updateWithCity(city: City) {
    id = city.identifier
    name = city.name
  }
  
  var city : City {
    return City(identifier: id, name: name)
  }
}