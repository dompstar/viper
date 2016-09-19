//
//  CityDB.swift
//  MTC2016
//
//  Created by Orlando Schäfer on 08/09/16.
//  Copyright © 2016 arconsis IT-Solutions GmbH. All rights reserved.
//

import Foundation
import CoreData
import Common

class CityDB: NSManagedObject {

  static let entityName = "CityDB"

  var city: City {
    get {
      return City(identifier: id, name: name)
    }
    set {
      id = newValue.identifier
      name = newValue.name
    }
  }
  
  override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
    super.init(entity: entity, insertIntoManagedObjectContext: context)
  }
  
  init(context: NSManagedObjectContext) {
    let entityDescription = NSEntityDescription.entityForName(CityDB.entityName, inManagedObjectContext: context)!
    super.init(entity: entityDescription, insertIntoManagedObjectContext: context)
  }

}

